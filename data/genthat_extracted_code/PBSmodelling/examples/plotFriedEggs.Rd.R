library(PBSmodelling)


### Name: plotFriedEggs
### Title: Render a Pairs Plot as Fried Eggs and Beer
### Aliases: plotFriedEggs
### Keywords: hplot

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  x=rnorm(5000,10,3); y=-x+rnorm(5000,1,4); z=x+rnorm(5000,1,3)
  A=data.frame(x=x,y=y,z=z)
  for (i in 1:3)
    switch(i,
    {plotFriedEggs(A,eggs=TRUE,rings=FALSE);
     pause("Here are the eggs...(Press Enter for next)")},
    {plotFriedEggs(A,eggs=FALSE,rings=TRUE);
     pause("Here are the rings...(Press Enter for next)")},
    {plotFriedEggs(A,eggs=FALSE,rings=FALSE);
     cat("Here is the pepper alone.\n")} )
  par(oldpar)
})



