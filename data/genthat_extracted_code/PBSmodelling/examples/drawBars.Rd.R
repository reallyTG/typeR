library(PBSmodelling)


### Name: drawBars
### Title: Draw a Linear Barplot on the Current Plot
### Aliases: drawBars
### Keywords: hplot

### ** Examples

local(envir=.PBSmodEnv,expr={
    if (dev.cur()>1) {
      oldpar=par(no.readonly=TRUE); on.exit(par(oldpar)) }
  plot(0:10,0:10,type="n")
  drawBars(x=1:9,y=9:1,col="deepskyblue4",fill="cyan",lwd=3)
})



