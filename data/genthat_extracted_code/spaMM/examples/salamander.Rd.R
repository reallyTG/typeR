library(spaMM)


### Name: salamander
### Title: Salamander mating data
### Aliases: salamander
### Keywords: datasets

### ** Examples

data("salamander")

## Not run: 
##D  
##D 
##D if (spaMM.getOption("example_maxtime")>0.7) {
##D   HLfit(cbind(Mate,1-Mate)~TypeF+TypeM+TypeF*TypeM+(1|Female)+(1|Male),
##D     family=binomial(),data=salamander,HLmethod="ML",control.HLfit=list(LevenbergM=FALSE))
##D }
## End(Not run)
if (spaMM.getOption("example_maxtime")>0.7) {
 fitme(cbind(Mate,1-Mate)~TypeF+TypeM+TypeF*TypeM+(1|Female)+(1|Male),
    family=binomial(),data=salamander,control.HLfit=list(LevenbergM=FALSE))
}



