library(conting)


### Name: total_pop
### Title: Evaluate Posterior Distribution of Total Population Size
### Aliases: total_pop

### ** Examples

set.seed(1)
## Set seed for reproducibility

data(spina)
## Load spina data

test1<-bict(formula=y~(S1+S2+S3+eth)^2,data=spina,n.sample=100,prior="UIP")

## For the spina dataset. We do 100 iterations under the unit information 
## prior. The maximal model is the model with two-way interactions and we 
## start from this model at the posterior model

tp<-total_pop(test1,n.burnin=10)
## Use a burn-in phase of 10 iterations
tp
## Print out results. Will get:

#Posterior mean of total population size = 727.0667 
#95 % highest posterior density interval for total population size = ( 706 757 )

## Could do a plot
## Not run: plot(tp)

## Do a summary of MCMC sample from total population size
summary(tp$TOT)
## Will get

#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  697.0   716.2   727.0   727.1   735.8   763.0




