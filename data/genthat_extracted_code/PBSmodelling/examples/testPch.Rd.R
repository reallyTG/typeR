library(PBSmodelling)


### Name: testPch
### Title: Display Plotting Symbols or Octal Strings
### Aliases: testPch
### Keywords: utilities color

### ** Examples

local(envir=.PBSmodEnv,expr={
  testPch(123:255)
})
local(envir=.PBSmodEnv,expr={
  testPch(1:25,ncol=5)
})
local(envir=.PBSmodEnv,expr={
  testPch(41:277,octal=TRUE)
})



