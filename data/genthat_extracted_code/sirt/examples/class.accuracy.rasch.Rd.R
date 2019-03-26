library(sirt)


### Name: class.accuracy.rasch
### Title: Classification Accuracy in the Rasch Model
### Aliases: class.accuracy.rasch
### Keywords: Classification accuracy

### ** Examples

#############################################################################
# EXAMPLE 1: Reading dataset
#############################################################################
data( data.read, package="sirt")
dat <- data.read

# estimate the Rasch model
mod <- sirt::rasch.mml2( dat )

# estimate classification accuracy (3 levels)
cutscores <- c( -1, .3 )    # cut scores at theta=-1 and theta=.3
class.accuracy.rasch( cutscores=cutscores, b=mod$item$b,
           meantheta=0,  sdtheta=mod$sd.trait,
           theta.l=seq(-4,4,len=200 ), n.sims=3000)
  ##   Cut Scores
  ##   [1] -1.0  0.3
  ##
  ##   WLE reliability (by simulation)=0.671
  ##   WLE consistency (correlation between two parallel forms)=0.649
  ##
  ##   Classification accuracy and consistency
  ##              agree0 agree1 kappa consistency
  ##   analytical   0.68  0.990 0.492          NA
  ##   simulated    0.70  0.997 0.489       0.599
  ##
  ##   Probability classification table
  ##               Est_Class1 Est_Class2 Est_Class3
  ##   True_Class1      0.136      0.041      0.001
  ##   True_Class2      0.081      0.249      0.093
  ##   True_Class3      0.009      0.095      0.294



