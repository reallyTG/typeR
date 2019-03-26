library(CEGO)


### Name: benchmarkGeneratorNKL
### Title: NK-Landscape Benchmark Creation
### Aliases: benchmarkGeneratorNKL

### ** Examples

fun <- benchmarkGeneratorNKL(6,2)
fun(c(1,0,1,1,0,0))
fun(c(1,0,1,1,0,1))
fun(c(0,1,0,0,1,1))
fun <- benchmarkGeneratorNKL(6,3)
fun(c(1,0,1,1,0,0))
fun <- benchmarkGeneratorNKL(6,2,c(-1,1))
fun(c(1,0,1,1,0,0))
fun <- benchmarkGeneratorNKL(6,2,c(-1,1),g=matrix(runif(48),6))
fun(c(1,0,1,1,0,0))
fun(sample(c(0,1),6,TRUE))




