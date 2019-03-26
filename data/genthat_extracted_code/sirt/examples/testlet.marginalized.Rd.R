library(sirt)


### Name: testlet.marginalized
### Title: Marginal Item Parameters from a Testlet (Bifactor) Model
### Aliases: testlet.marginalized
### Keywords: Testlet model Bifactor model

### ** Examples

#############################################################################
# EXAMPLE 1: Small numeric example for Rasch testlet model
#############################################################################

# Rasch testlet model with 9 items contained into 3 testlets
# the third testlet has essentially no dependence and therefore
# no testlet variance
testlet <- rep( 1:3, each=3 )
a1 <- rep(1, 9 )   # item slopes first dimension
d1 <- rep( c(-1.25,0,1.5), 3 ) # item intercepts
a.testlet <- rep( 1, 9 )  # item slopes testlets
var.testlet <- c( .8, .2, 0 )  # testlet variances

# apply function
res <- sirt::testlet.marginalized( a1=a1, d1=d1, testlet=testlet,
            a.testlet=a.testlet, var.testlet=var.testlet )
round( res, 2 )
  ##    item testlet a1    d1 a.testlet var.testlet a1_marg d1_marg
  ##  1    1       1  1 -1.25         1         0.8    0.89   -1.11
  ##  2    2       1  1  0.00         1         0.8    0.89    0.00
  ##  3    3       1  1  1.50         1         0.8    0.89    1.33
  ##  4    4       2  1 -1.25         1         0.2    0.97   -1.21
  ##  5    5       2  1  0.00         1         0.2    0.97    0.00
  ##  6    6       2  1  1.50         1         0.2    0.97    1.45
  ##  7    7       3  1 -1.25         1         0.0    1.00   -1.25
  ##  8    8       3  1  0.00         1         0.0    1.00    0.00
  ##  9    9       3  1  1.50         1         0.0    1.00    1.50

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: Dataset reading
##D #############################################################################
##D 
##D library(TAM)
##D data(data.read)
##D resp <- data.read
##D maxiter <-  100
##D 
##D # Model 1: Rasch testlet model with 3 testlets
##D dims <- substring( colnames(resp),1,1 )  # define dimensions
##D mod1 <- TAM::tam.fa( resp=resp, irtmodel="bifactor1", dims=dims,
##D                control=list(maxiter=maxiter) )
##D # marginal item parameters
##D res1 <- sirt::testlet.marginalized( mod1 )
##D 
##D #***
##D # Model 2: estimate bifactor model but assume that items 3 and 5 do not load on
##D #           specific factors
##D dims1 <- dims
##D dims1[c(3,5)] <- NA
##D mod2 <- TAM::tam.fa( resp=resp, irtmodel="bifactor2", dims=dims1,
##D               control=list(maxiter=maxiter) )
##D res2 <- sirt::testlet.marginalized( mod2 )
##D res2
## End(Not run)



