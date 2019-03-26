library(R.devices)


### Name: withPar
### Title: Evaluate an R expression with graphical parameters set
###   temporarily
### Aliases: withPar
### Keywords: IO programming

### ** Examples

withPar({
  layout(1:4)

  withPar({
    plot(1:10)
    plot(10:1)
  }, pch=4)

  withPar({
    plot(1:10)
    plot(10:1)
  }, pch=0, bg="yellow")
}, mar=c(2,2,1,1))



