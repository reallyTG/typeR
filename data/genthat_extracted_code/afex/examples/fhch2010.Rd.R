library(afex)


### Name: fhch2010
### Title: Data from Freeman, Heathcote, Chalmers, & Hockley (2010)
### Aliases: fhch2010
### Keywords: dataset

### ** Examples


data("fhch2010")
str(fhch2010)

a1 <- aov_ez("id", "log_rt", fhch2010, between = "task", 
             within = c("density", "frequency", "length", "stimulus"))
nice(a1)

if (requireNamespace("emmeans")) {
  emmeans::emmip(a1, frequency~length|task+stimulus)

  emmeans::emmip(a1, frequency~density|task+stimulus)
}


## Not run: 
##D a2 <- aov_ez("id", "rt", fhch2010, between = "task", 
##D              within = c("density", "frequency", "length", "stimulus"))
##D nice(a2)
##D 
##D if (requireNamespace("emmeans")) {
##D   emmeans::emmip(a2, frequency~length|task+stimulus)
##D   
##D   emmeans::emmip(a2, frequency~density|task+stimulus)
##D }
## End(Not run)



