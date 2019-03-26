library(PBSmodelling)


### Name: setPBSoptions
### Title: Set A User Option
### Aliases: setPBSoptions
### Keywords: methods

### ** Examples

local(envir=.PBSmodEnv,expr={
  myList=list(alpha=1,beta=2,gamma=3,delta=4)
  setPBSoptions(option="myList", myList)
  cat("Original myList:\n---------------\n")
  print(getPBSoptions("myList"))
  setPBSoptions(option="myList", value=list(gamma=130), sublist=TRUE)
  cat("Revised myList:\n--------------\n")
  print(getPBSoptions("myList"))
})



