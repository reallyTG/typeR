library(R.oo)


### Name: getInstantiationTime.Object
### Title: Gets the time when the object was instantiated
### Aliases: getInstantiationTime.Object Object.getInstantiationTime
###   getInstantiationTime,Object-method
### Keywords: programming methods internal methods

### ** Examples

  oopts <- options("R.oo::Object/instantiationTime"=TRUE)
  obj <- Object()
  print(getInstantiationTime(obj))
  options(oopts)



