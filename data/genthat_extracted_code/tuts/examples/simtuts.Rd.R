library(tuts)


### Name: simtuts
### Title: Generating time-uncertain time series
### Aliases: simtuts

### ** Examples

# 1. Generate actual and observed time series as a sum of 2 sine functions:
DATA=simtuts(N=50,Harmonics=c(10,20,0), sin.ampl=c(10,10, 0), cos.ampl=c(0,0,0),trend=0,
y.sd=2, ti.sd=0.3)




