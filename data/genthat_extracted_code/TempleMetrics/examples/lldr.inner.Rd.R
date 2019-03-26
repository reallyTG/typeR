library(TempleMetrics)


### Name: lldr.inner
### Title: lldr.inner
### Aliases: lldr.inner

### ** Examples

data(igm)
lcinc <- 10
Y <- igm$lcfincome
XMain <- igm$lfincome
XOther <- data.frame(COL=1*(igm$HEDUC=="COL"))
lldr.inner(lcinc, 10, Y, XMain, XOther)




