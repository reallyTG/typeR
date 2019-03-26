library(MANOVA.RM)


### Name: conf.reg
### Title: The conf.reg() function calculates confidence regions for
###   contrasts in multivariate factorial designs. In the two-dimensional
###   case, confidence ellipsoids can be plotted via the generic 'plot()'
###   function.
### Aliases: conf.reg

### ** Examples

data(EEG)
EEG_mod <- MANOVA(resp ~ sex * diagnosis, 
                    data = EEG, subject = "id", resampling = "paramBS", 
                    alpha = 0.05, iter = 100, CPU = 1)
conf.reg(EEG_mod, nullhypo = "sex")





