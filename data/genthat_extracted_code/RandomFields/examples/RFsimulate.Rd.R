library(RandomFields)


### Name: RFsimulate
### Title: Simulation of Random Fields
### Aliases: RFsimulate
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

#############################################################
## ##
## ONLY TWO VERY BASIC EXAMPLES ARE GIVEN HERE ##
## see ##
## ?RMsimulate.more.examples ##
## and ##
## ?RFsimulateAdvanced ##
## for more examples ##
## ##
#############################################################

#############################################################
## ##
## Unconditional simulation ## 
## ##
#############################################################

## first let us look at the list of implemented models
RFgetModelNames(type="positive definite", domain="single variable",
                iso="isotropic") 

## our choice is the exponential model;
## the model includes nugget effect and the mean:
model <- RMexp(var=5, scale=10) + # with variance 4 and scale 10
 RMnugget(var=1) + # nugget
 RMtrend(mean=0.5) # and mean
 
## define the locations:
from <- 0
to <- 20
x.seq <- seq(from, to, length=200) 
y.seq <- seq(from, to, length=200)

simu <- RFsimulate(model, x=x.seq, y=y.seq)
plot(simu)



#############################################################
## ##
## Conditional simulation ## 
## ##
#############################################################

# first we simulate some random values at 
# 100 random locations:
n <- 100
x <- runif(n=n, min=-1, max=1)
y <- runif(n=n, min=-1, max=1)
dta <- RFsimulate(model = RMexp(), x=x, y=y, grid=FALSE)
plot(dta)

# let simulate a field conditional on the above data
L <- if (interactive()) 100 else 5
x.seq.cond <- y.seq.cond <- seq(-1.5, 1.5, length=L)
model <- RMexp()
cond <- RFsimulate(model, x=x.seq.cond, y=y.seq.cond, data=dta)
plot(cond, dta)
## Don't show: 
FinalizeExample()
## End(Don't show)


