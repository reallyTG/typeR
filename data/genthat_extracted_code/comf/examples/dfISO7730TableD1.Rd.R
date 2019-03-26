library(comf)


### Name: dfISO7730TableD1
### Title: Adjusted data from Table D1 of ISO 7730
### Aliases: dfISO7730TableD1 dfISO7730
### Keywords: datasets

### ** Examples

data(dfISO7730TableD1)
head(dfISO7730TableD1)

PMV <- sapply(seq(nrow(dfISO7730TableD1)), function(x) { calcPMV(dfISO7730TableD1$ta[x], 
dfISO7730TableD1$tr[x], dfISO7730TableD1$vel[x], dfISO7730TableD1$rh[x], dfISO7730TableD1$clo[x], 
dfISO7730TableD1$met[x]) } ) 

PPD <- sapply(seq(nrow(dfISO7730TableD1)), function(x) { calcPPD(dfISO7730TableD1$ta[x], 
dfISO7730TableD1$tr[x], dfISO7730TableD1$vel[x], dfISO7730TableD1$rh[x], dfISO7730TableD1$clo[x], 
dfISO7730TableD1$met[x]) } ) 

plot(PMV~dfISO7730TableD1$pmv)
data.frame(pmv=dfISO7730TableD1$pmv, PMV)

plot(PPD~dfISO7730TableD1$ppd)
data.frame(ppd=dfISO7730TableD1$ppd, PPD)




