library(CEGO)


### Name: benchmarkGeneratorMaxCut
### Title: MaxCut Benchmark Creation
### Aliases: benchmarkGeneratorMaxCut

### ** Examples

fun <- benchmarkGeneratorMaxCut(N=6)
fun(c(1,0,1,1,0,0))
fun(c(1,0,1,1,0,1))
fun(c(0,1,0,0,1,1))
fun <- benchmarkGeneratorMaxCut(A=matrix(c(0,1,0,1,1,0,1,0,0,1,0,1,1,0,1,0),4,4))
fun(c(1,0,1,0))
fun(c(1,0,1,1))
fun(c(0,1,0,1))




