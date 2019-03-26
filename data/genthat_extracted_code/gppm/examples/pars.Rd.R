library(gppm)


### Name: pars
### Title: Parameter Names
### Aliases: pars

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
parameters <- pars(lgcm)
## End(No test)



