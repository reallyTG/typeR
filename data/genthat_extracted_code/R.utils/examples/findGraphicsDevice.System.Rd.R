library(R.utils)


### Name: System$findGraphicsDevice
### Title: Searches for a working PNG device
### Aliases: System$findGraphicsDevice findGraphicsDevice.System
###   System.findGraphicsDevice findGraphicsDevice,System-method
### Keywords: internal methods device

### ** Examples

  fcn <- System$findGraphicsDevice()
  if (identical(fcn, png)) {
    cat("PNG device found: png()")
  } else if (identical(fcn, bitmap)) {
    cat("PNG device found: bitmap()")
  } else {
    cat("PNG device not found.")
  }



