library(MANOVA.RM)


### Name: RM
### Title: Tests for Repeated Measures in Semi-Parametric Factorial Designs
### Aliases: RM

### ** Examples

data(o2cons)
## Not run: 
##D oxy <- RM(O2 ~ Group * Staphylococci * Time, data = o2cons, 
##D             subject = "Subject", no.subf = 2, iter = 1000, resampling = "Perm", CPU = 1)
##D summary(oxy)
##D plot(oxy, factor = "Group") 
##D  
##D # For more details including the output of the examples also refer to the 
##D # package vignette.
##D 
##D # using the EEG data, consider additional within-subjects factors 'brain region' 
##D # and 'feature'
##D data(EEG)
##D EEG_model <- RM(resp ~ sex * diagnosis * feature * region, 
##D                data = EEG, subject = "id", no.subf = 2, resampling = "WildBS",
##D                iter = 1000,  alpha = 0.01, CPU = 4, seed = 987, dec = 2)
##D summary(EEG_model)
## End(Not run)




