library(R.oo)


### Name: getInternalAddress.Object
### Title: Gets the memory location where the Object resides
### Aliases: getInternalAddress.Object Object.getInternalAddress
###   getInternalAddress,Object-method
### Keywords: programming methods internal methods

### ** Examples

  obj <- Object()
  getInternalAddress(obj, format="numeric")    # 179742632
  getInternalAddress(obj, format="hexstring")  # "0x000000000ab6a7a8"



