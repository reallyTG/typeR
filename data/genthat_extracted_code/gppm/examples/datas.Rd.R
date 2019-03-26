library(gppm)


### Name: datas
### Title: Data Set
### Aliases: datas

### ** Examples

## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
myData <- datas(lgcm)
## End(No test)



