library(RCALI)


### Name: fseed
### Title: Individual seed dispersion function
### Aliases: fseed
### Keywords: manip

### ** Examples


distance = seq(1,1.5, by=0.05)
a=matrix(distance, ncol=1)
b= apply(a,1,fseed)
par(pty="s")
plot(x=distance, y =b)



