#if os(OSX) || os(iOS) || os(watchOS) || os(tvOS)

import Foundation

extension Bundle {

    /**
     Locates the first bundle with a '.xctest' file extension.
     */
    internal static var currentTestBundle: Bundle? {
        return allBundles.first { $0.bundlePath.hasSuffix(".xctest") }
    }

    /**
     Return the module name of the bundle.
     Uses the bundle filename and transform it to match Xcode's transformation.
     Module name has to be a valid "C99 extended identifier".
     */
    internal var moduleName: String {
        return bundleURL.fileName
            .replacingOccurrences(of: " ", with: "_")
            .replacingOccurrences(of: "-", with: "_")
    }
}

#endif
