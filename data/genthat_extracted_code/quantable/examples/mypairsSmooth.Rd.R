library(quantable)


### Name: mypairsSmooth
### Title: smoothScatter pairs
### Aliases: mypairsSmooth

### ** Examples

tmp = matrix(rep((1:100),times = 4) + rnorm(100*4,0,3),ncol=4)
mypairsSmooth(tmp,main="small data", legend=TRUE)
mypairsSmooth(tmp,main="small data", diag.panel=panel.hist)
mypairsSmooth(tmp,log="xy",main="small data", legend=TRUE)



