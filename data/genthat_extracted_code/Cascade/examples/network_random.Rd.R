library(Cascade)


### Name: network_random
### Title: Generates a network.
### Aliases: network_random

### ** Examples

set.seed(1)
Net<-network_random(
	nb=100,
	time_label=rep(1:4,each=25),
	exp=1,
	init=1,
	regul=round(rexp(100,1))+1,
	min_expr=0.1,
	max_expr=2,
	casc.level=0.4
	)
plot(Net)



