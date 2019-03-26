library(RandomFields)


### Name: RMbrownresnick
### Title: Tail correlation function of the Brown-Resnick process
### Aliases: RMbrownresnick 'powered error function' 'error function model'
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

#plot covariance model of type RMbrownresnick
RMmodel <- RMfbm(alpha=1.5, scale=0.2)
plot(RMbrownresnick(RMmodel))

#simulate and plot corresponding Gaussian random field
x <- seq(-5, 5, 0.05)
z <- RFsimulate(RMbrownresnick(RMmodel), x=x, y=x)
plot(z)
## Don't show: 
FinalizeExample()
## End(Don't show)


