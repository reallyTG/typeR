library(PBSmodelling)


### Name: expandGraph
### Title: Expand the Plot Area by Adjusting Margins
### Aliases: expandGraph
### Keywords: device

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  expandGraph(mfrow=c(2,1));
  tt=seq(from=-10, to=10, by=0.05);

  plot(tt,sin(tt), xlab="this is the x label",  ylab="this is the y label", 
    main="main title", sub="sometimes there is a \"sub\" title")
  plot(cos(tt),sin(tt*2), xlab="cos(t)", ylab="sin(2 t)", main="main title", 
    sub="sometimes there is a \"sub\" title")
  par(oldpar)
})



