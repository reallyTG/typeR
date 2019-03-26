library(tframe)


### Name: tfExpand
### Title: Expand a Tframe or Tframed Object.
### Aliases: tfExpand tfExpand.default tfExpand.tframe tfTruncate
###   tfTruncate.default tfTruncate.tframe
### Keywords: programming utilities ts chron

### ** Examples

    z <- ts(rnorm(100), start=c(1982,1), frequency=12)
    Dz <- tframed(diff(z), tfTruncate(tframe(z), start=2))
    tframe(Dz)
    IDz <- tframed(cumsum(c(0, Dz)), tfExpand(tframe(Dz), add.start=1))
    tframe(IDz)
    tframe(tfTruncate(z, start=5))



