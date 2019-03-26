library(qtl)


### Name: fitstahl
### Title: Fit Stahl interference model
### Aliases: fitstahl
### Keywords: models

### ** Examples

## Don't show: 
set.seed(12201969)
## End(Don't show)
# Simulate genetic map: one chromosome of length 200 cM with
# a 2 cM marker spacing
mymap <- sim.map(200, 51, anchor.tel=TRUE, include.x=FALSE,
                 sex.sp=FALSE, eq.spacing=TRUE)

# Simulate data under the chi-square model, no errors
mydata <- sim.cross(mymap, n.ind=250, type="bc",
                    error.prob=0, m=3, p=0)

# Fit the chi-square model for specified m's
## Not run: output <- fitstahl(mydata, m=1:5, p=0, error.prob=0)
## Don't show: 
output <- fitstahl(mydata, m=1, p=0, error.prob=0,tol=0.001)
## End(Don't show)
plot(output$m, output$loglik, lwd=2, type="b")

# Find the MLE of m in the chi-square model
## Not run: mle <- fitstahl(mydata, p=0, error.prob=0)

## Not run: 
##D # Simulate data under the Stahl model, no errors
##D mydata <- sim.cross(mymap, n.ind=250, type="bc",
##D                     error.prob=0, m=3, p=0.1)
##D 
##D # Find MLE of m for the Stahl model with known p 
##D mle.stahl <- fitstahl(mydata, p=0.1, error.prob=0)
##D 
##D # Fit the Stahl model with unknown p and m,
##D # get results for m=0, 1, 2, ..., 8
##D output <- fitstahl(mydata, m=0:8, error.prob=0)
##D plot(output$m, output$loglik, type="b", lwd=2)
## End(Not run)



