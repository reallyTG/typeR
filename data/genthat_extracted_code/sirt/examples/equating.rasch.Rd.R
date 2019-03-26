library(sirt)


### Name: equating.rasch
### Title: Equating in the Generalized Logistic Rasch Model
### Aliases: equating.rasch
### Keywords: Equating Linking

### ** Examples

#############################################################################
# EXAMPLE 1: Linking item parameters of the PISA study
#############################################################################

data(data.pisaPars)
pars <- data.pisaPars

# linking the two studies with the Rasch model
mod <- sirt::equating.rasch(x=pars[,c("item","study1")], y=pars[,c("item","study2")])
  ##   Mean.Mean    Haebara Stocking.Lord
  ## 1   0.08828 0.08896269    0.09292838

## Not run: 
##D #*** linking using the plink package
##D # The plink package is not available on CRAN anymore.
##D # You can download the package with
##D # utils::install.packages("plink", repos="http://www2.uaem.mx/r-mirror")
##D library(plink)
##D I <- nrow(pars)
##D pm <- plink::as.poly.mod(I)
##D # linking parameters
##D plink.pars1 <- list( "study1"=data.frame( 1, pars$study1, 0 ),
##D                      "study2"=data.frame( 1, pars$study2, 0 ) )
##D       # the parameters are arranged in the columns:
##D       # Discrimination, Difficulty, Guessing Parameter
##D # common items
##D common.items <- cbind("study1"=1:I,"study2"=1:I)
##D # number of categories per item
##D cats.item <- list( "study1"=rep(2,I), "study2"=rep(2,I))
##D # convert into plink object
##D x <- plink::as.irt.pars( plink.pars1, common.items, cat=cats.item,
##D           poly.mod=list(pm,pm))
##D # linking using plink: first group is reference group
##D out <- plink::plink(x, rescale="MS", base.grp=1, D=1.7)
##D # summary for linking
##D summary(out)
##D   ##   -------  group2/group1*  -------
##D   ##   Linking Constants
##D   ##
##D   ##                        A         B
##D   ##   Mean/Mean     1.000000 -0.088280
##D   ##   Mean/Sigma    1.000000 -0.088280
##D   ##   Haebara       1.000000 -0.088515
##D   ##   Stocking-Lord 1.000000 -0.096610
##D # extract linked parameters
##D pars.out <- plink::link.pars(out)
## End(Not run)



