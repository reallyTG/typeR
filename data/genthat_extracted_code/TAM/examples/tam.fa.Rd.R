library(TAM)


### Name: tam.fa
### Title: Bifactor Model and Exploratory Factor Analysis
### Aliases: tam.fa
### Keywords: Exploratory factor analysis Testlet model Bifactor model

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Dataset reading from sirt package
##D #############################################################################
##D 
##D data(data.read,package="sirt")
##D resp <- data.read
##D 
##D #***
##D # Model 1a: Exploratory factor analysis with 2 factors
##D mod1a <- TAM::tam.fa( resp=resp, irtmodel="efa", nfactors=2  )
##D summary(mod1a)
##D # varimax rotation
##D stats::varimax(mod1a$B.stand)
##D # promax rotation
##D stats::promax(mod1a$B.stand)
##D # more rotations are included in the GPArotation package
##D library(GPArotation)
##D # geomin rotation oblique
##D GPArotation::geominQ( mod1a$B.stand )
##D # quartimin rotation
##D GPArotation::quartimin( mod1a$B.stand )
##D 
##D #***
##D # Model 1b: Rasch testlet model with 3 testlets
##D dims <- substring( colnames(resp),1,1 )     # define dimensions
##D mod1b <- TAM::tam.fa( resp=resp, irtmodel="bifactor1", dims=dims )
##D summary(mod1b)
##D 
##D #***
##D # Model 1c: Bifactor model
##D mod1c <- TAM::tam.fa( resp=resp, irtmodel="bifactor2", dims=dims )
##D summary(mod1c)
##D 
##D #***
##D # Model 1d: reestimate Model 1c but assume that items 3 and 5 do not load on
##D #           specific factors
##D dims1 <- dims
##D dims1[c(3,5)] <- NA
##D mod1d <- TAM::tam.fa( resp=resp, irtmodel="bifactor2", dims=dims1 )
##D summary(mod1d)
## End(Not run)



