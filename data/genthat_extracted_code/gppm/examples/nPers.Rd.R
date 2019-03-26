library(gppm)


### Name: nPers
### Title: Number of persons
### Aliases: nPers

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
numberPersons <- nPers(lgcm)
## End(No test)



