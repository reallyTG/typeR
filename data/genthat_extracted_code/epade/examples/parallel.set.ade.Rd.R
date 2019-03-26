library(epade)


### Name: parallel.set.ade
### Title: Parallel set plot
### Aliases: parallel.set.ade
### Keywords: parallel

### ** Examples

x<-rbinom(1000, 1, 0.25)
y<-rbinom(1000, 1, 0.5)
z<-rbinom(1000, 1, 0.75)
parallel.set.ade(list(x,y,z), wall=2)



