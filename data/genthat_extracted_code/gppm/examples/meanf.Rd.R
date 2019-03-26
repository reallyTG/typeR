library(gppm)


### Name: meanf
### Title: Mean Function
### Aliases: meanf

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
myMean <- meanf(lgcm)
## End(No test)



