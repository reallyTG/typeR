library(sdcMicro)


### Name: generateStrata
### Title: Generate one strata variable from multiple factors
### Aliases: generateStrata

### ** Examples


x <- testdata
x <- generateStrata(x,c("sex","urbrur"),"strataIDvar")
head(x)




