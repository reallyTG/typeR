library(demography)


### Name: coherentfdm
### Title: Coherent functional demographic model for grouped data
### Aliases: coherentfdm
### Keywords: models

### ** Examples

fr.short <- extract.years(fr.sm,1950:2006)
fr.fit <- coherentfdm(fr.short)
summary(fr.fit)
plot(fr.fit$product, components=3)



