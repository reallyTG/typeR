library(SuppDists)


### Name: ghyper
### Title: Generalized hypergeometric distributions
### Aliases: dghyper pghyper qghyper rghyper sghyper tghyper 'Generalized
###   hypergeometric' 'Negative hypergeometric' 'Inverse hypergeometric'
###   'Hypergeometric waiting time' Beta-binomial Beta-negative-binomial
###   Beta-Pascal 'Generalized Waring'
### Keywords: distribution

### ** Examples


tghyper(a=4, k=4, N=10) 		## classic
tghyper(a=4.1, k=5, N=10) 		## type IA(i) Real classic
tghyper(a=5, k=4.1, N=10) 		## type IA(ii) Real classic
tghyper(a=4.2, k=4.6, N=12.2) 		## type IB
tghyper(a=-5.1, k=10, N=-7) 		## type IIA
tghyper(a=-0.5, k=5.9, N=-0.7) 		## type IIB
tghyper(a=10, k=-5.1, N=-7) 		## type IIIA Negative hypergeometric
tghyper(a=5.9, k=-0.5, N=-0.7) 		## type IIIB
tghyper(a=-1, k=-1, N=5) 		## type IV Generalized Waring

sghyper(a=-1, k=-1, N=5)
plot(function(x)dghyper(x,a=-1,k=-1,N=5),0,5)

#Fisher's exact test: contingency table with rows (1,3),(3,1) 
pghyper(1,4,4,8)
pghyper(3,4,4,8,lower.tail=FALSE)



#Beta-binomial applications:

#Application examples:
tghyper(-4,3,-6)
pghyper(2,-4,3,-6,lower=FALSE)
pghyper(0,-2,10,-101)
sghyper(-1,95,-6)$Mean+1






