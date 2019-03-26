library(mwaved)


### Name: makeSignals
### Title: Generate test signals for simulation
### Aliases: makeSignals makeLIDAR makeBumps makeDoppler makeCusp
###   makeBlocks makeHeaviSine

### ** Examples

n <- 1024
x <- (1:n)/n
signal <- makeLIDAR(n)
plot(x, signal, main = 'LIDAR test signal', type = 'l')
signal <- makeBumps(n)
plot(x, signal, main = 'Bumps test signal', type = 'l')
signal <- makeDoppler(n)
plot(x, signal, main = 'Doppler test signal', type = 'l')
signal <- makeCusp(n)
plot(x, signal, main = 'Cusp test signal', type = 'l')
signal <- makeBlocks(n)
plot(x, signal, main = 'Blocks test signal', type = 'l')
signal <- makeHeaviSine(n)
plot(x, signal, main = 'HeaviSine test signal', type = 'l')



