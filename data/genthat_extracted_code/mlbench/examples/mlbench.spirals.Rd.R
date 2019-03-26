library(mlbench)


### Name: mlbench.spirals
### Title: Two Spirals Benchmark Problem
### Aliases: mlbench.spirals mlbench.1spiral
### Keywords: datagen

### ** Examples

# 1 cycle each, no noise
p<-mlbench.spirals(300)
plot(p)
#
# 1.5 cycles each, with noise
p<-mlbench.spirals(300,1.5,0.05)
plot(p)



