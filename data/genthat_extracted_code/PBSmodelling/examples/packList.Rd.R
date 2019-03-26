library(PBSmodelling)


### Name: packList
### Title: Pack a List with Objects
### Aliases: packList
### Keywords: list file

### ** Examples

local(envir=.PBSmodEnv,expr={
  fn = function() {
    alpha=rnorm(10)
    beta=letters
    gamma=mean
    delta=longley
    packList(c("alpha","beta","gamma","delta")) }
  fn(); tprint(PBSlist)
})



