library(swissMrP)


### Name: map.MrP
### Title: Map for MrP Estimates
### Aliases: map.MrP
### Keywords: Map Plot

### ** Examples

# Vanilla example
fake.pref <- runif(26)
class(fake.pref) <- "swissMrP"
## No test: 
map.MrP(fake.pref, main="This Map Shows Random Data", 
        legend.text1="Support for Anything")
        
## End(No test)
## changing intervals
## No test: 
map.MrP(fake.pref, 
        threshold=c(0,0.3,0.45,0.48,0.49,0.5,0.51,0.52,0.55,0.7,1))
        
## End(No test)
## no labels
## No test: 
map.MrP(fake.pref, main="This Map Shows Random Data", 
        legend.text1="Support for Anything", labels=FALSE)
        
## End(No test)
## specify different colors and less groups
## No test: 
map.MrP(fake.pref, main="This Map Shows Random Data", 
        legend.text1="Support for Anything", 
        colors.m=c("skyblue","skyblue1","skyblue2","skyblue3",
        "slateblue","slateblue1","slateblue2"))
        
## End(No test)




