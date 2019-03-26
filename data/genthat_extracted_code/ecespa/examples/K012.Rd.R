library(ecespa)


### Name: K012
### Title: Tests against 'independent labelling'
### Aliases: K012
### Keywords: spatial

### ** Examples



data(Helianthemum)


# To get 2.5% and 97.5% envelopes of 999 random labelings.
## as in fig. 10 of De la Cruz (2006), change nsim= 999 and nrank=25
nsim <-19
nrank <-1



## Test asociation/repulsion between the fixed pattern of adult
## H. squamatum plants and the "variable" pattern of surviving and 
## dead seedlings,


cosa <- K012(Helianthemum, fijo="adultHS", i="deadpl", j="survpl",
             r=seq(0,200,le=201), nsim=nsim, nrank=nrank, correction="isotropic")

plot(cosa$k01, sqrt(./pi)-r~r,  col=c(3, 1, 3), lty=c(3, 1, 3), las=1,
         ylab=expression(L[12]), xlim=c(0, 200), 
	 main="adult HS vs. dead seedlings")

plot(cosa$k02, sqrt(./pi)-r~r, col=c(3, 1, 3), lty=c(3, 1, 3), las=1, 
         ylab=expression(L[12]), xlim=c(0, 200),
 	 main="adult HS vs. surviving seedlings")




