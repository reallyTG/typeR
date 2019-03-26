library(PBSmodelling)


### Name: testCol
### Title: Display Colours Available Using a Set of Strings
### Aliases: testCol
### Keywords: utilities color

### ** Examples

local(envir=.PBSmodEnv,expr={
  # mix and match patterns
  testCol(c("sky","fire","sea","wood"))
})
local(envir=.PBSmodEnv,expr={
  # display transparencies of blue
  testCol(rgb(0,0,1,seq(0.05,1,0.05)))
})
local(envir=.PBSmodEnv,expr={
  # display colours of the rainbow
  testCol(rainbow(64,end=0.75))
})
local(envir=.PBSmodEnv,expr={
  # display basic palette colours
  testCol(1:length(palette()))
})
local(envir=.PBSmodEnv,expr={
  # mix colour types
  testCol(c("#9e7ad3", "purple", 6))
})



