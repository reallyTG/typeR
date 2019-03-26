library(evoper)


### Name: NLWrapper.GetParameter
### Title: NLWrapper.GetParameter
### Aliases: NLWrapper.GetParameter

### ** Examples

## Not run: 
##D    rm(list=ls())
##D    p<- "C:/Program Files/NetLogo 6.0.4/app"
##D    m<- file.path(nlpath, "models", "Sample Models", "Biology", "Wolf Sheep Predation.nlogo")
##D    o<- NLWrapper.Model(p, m)
##D    v<- NLWrapper.GetParameter(o, c("initial-number-sheep"))
##D 
##D    or
##D 
##D    v<- NLWrapper.GetParameter(o, c("initial-number-sheep","initial-number-wolves")))
## End(Not run)




