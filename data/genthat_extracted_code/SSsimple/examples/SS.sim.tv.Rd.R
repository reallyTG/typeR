library(SSsimple)


### Name: SS.sim.tv
### Title: Simulation
### Aliases: SS.sim.tv
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(9999)

H.tv <- list()
for(i in 1:200) {
	H.tv[[i]] <- matrix( c( sin(i * 0.05), cos(i * 0.05) ), 1, 2 )
}

ssx <- SS.sim.tv( 0.99, H.tv, 0.001, 1, 200, c(4,4) )

plot(ssx$Z[ ,1], type="l")



