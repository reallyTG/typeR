library(comf)


### Name: dfISO7730AppE
### Title: Adjusted data from Appendix E of ISO 7730
### Aliases: dfISO7730AppE
### Keywords: datasets

### ** Examples

data(dfISO7730AppE)
head(dfISO7730AppE)

PMV <- sapply(seq(nrow(dfISO7730AppE)), function(x) { calcPMV(dfISO7730AppE$top[x], 
dfISO7730AppE$top[x], dfISO7730AppE$vel[x], dfISO7730AppE$rh[x], dfISO7730AppE$clo[x], 
dfISO7730AppE$met[x]) } ) 

plot(PMV~dfISO7730AppE$pmv)




