library(TAM)


### Name: data.janssen
### Title: Dataset from Janssen and Geiser (2010)
### Aliases: data.janssen data.janssen2
### Keywords: datasets

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: CCT data, Janssen and Geiser (2010, LID)
##D #            Latent class analysis based on data.janssen
##D #############################################################################
##D 
##D data(data.janssen)
##D dat <- data.janssen
##D colnames(dat)
##D   ##   [1] "PIS1"  "PIS3"  "PIS4"  "PIS5"  "SCR6"  "SCR9"  "SCR10" "SCR17"
##D 
##D #*********************************************************************
##D #*** Model 1: Latent class analysis with two classes
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LCA;
##D   NCLASSES(2);
##D   NSTARTS(10,20);
##D LAVAAN MODEL:
##D   # missing item numbers (e.g. PIS2) are ignored in the model
##D   F=~ PIS1__PIS5 + SCR6__SCR17
##D     "
##D mod3 <- TAM::tamaan( tammodel, resp=dat  )
##D summary(mod3)
##D 
##D # extract item response functions
##D imod2 <- IRT.irfprob(mod3)[,2,]
##D # plot class specific probabilities
##D ncl <- 2
##D matplot( imod2, type="o", pch=1:ncl, xlab="Item", ylab="Probability" )
##D legend( 1, .3, paste0("Class",1:ncl), lty=1:ncl, col=1:ncl, pch=1:ncl )
##D 
##D #*********************************************************************
##D #*** Model 2: Latent class analysis with three classes
##D 
##D tammodel <- "
##D ANALYSIS:
##D   TYPE=LCA;
##D   NCLASSES(3);
##D   NSTARTS(10,20);
##D LAVAAN MODEL:
##D   F=~ PIS1__PIS5 + SCR6__SCR17
##D     "
##D mod3 <- TAM::tamaan( tammodel, resp=dat  )
##D summary(mod3)
##D 
##D # extract item response functions
##D imod2 <- IRT.irfprob(mod3)[,2,]
##D # plot class specific probabilities
##D ncl <- 3
##D matplot( imod2, type="o", pch=1:ncl, xlab="Item", ylab="Probability" )
##D legend( 1, .3, paste0("Class",1:ncl), lty=1:ncl, col=1:ncl, pch=1:ncl )
##D 
##D # compare models
##D AIC(mod1); AIC(mod2)
## End(Not run)



