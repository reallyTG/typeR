library(evtree)


### Name: MAGICGammaTelescope
### Title: MAGIC Gamma Telescope
### Aliases: MAGICGammaTelescope
### Keywords: datasets

### ** Examples

data("MAGICGammaTelescope")
summary(MAGICGammaTelescope)
## Not run: 
##D set.seed(1090)
##D mgtt <- evtree(class ~ . , data = MAGICGammaTelescope) 
##D mgtt
##D table(predict(mgtt), MAGICGammaTelescope$class)
##D plot(mgtt)
## End(Not run)



