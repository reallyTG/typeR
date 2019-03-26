library(R.rsp)


### Name: RRspPackage$capabilitiesOf
### Title: Checks which tools are supported
### Aliases: RRspPackage$capabilitiesOf capabilitiesOf.RRspPackage
###   RRspPackage.capabilitiesOf capabilitiesOf,RRspPackage-method
###   RRspPackage.isCapableOf isCapableOf.RRspPackage
###   isCapableOf,RRspPackage-method
### Keywords: internal methods

### ** Examples

  # Display which tools are supported by the package
  print(capabilitiesOf(R.rsp))

  # Check whether AsciiDoc is supported
  print(isCapableOf(R.rsp, "asciidoc"))

  # Check whether pandoc v1.12 or newer is supported
  print(isCapableOf(R.rsp, "pandoc (>= 1.12)"))



