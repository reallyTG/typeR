library(wux)


### Name: aovWux
### Title: Missing value reconstruction based on ANOVA
### Aliases: aovWux
### Keywords: datagen models regression classes NA

### ** Examples

## read WUX test data
library("wux")
data(ensembles)

wuxtest.df <- subset(ensembles, subreg == "GAR")

## data reconstruction to obtain a balanced design
reconstruct.df <- reconstruct(wuxtest.df,
  factor1.name = "acronym", factor2.name = "gcm", data.name =
  "perc.delta.precipitation_amount")

## calculate ANOVA
anova.list <- aovWux(perc.delta.precipitation_amount ~ acronym +
  gcm, reconstruct.df)



