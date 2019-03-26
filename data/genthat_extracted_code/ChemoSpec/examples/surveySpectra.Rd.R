library(ChemoSpec)


### Name: surveySpectra
### Title: Plot Measures of Central Tendency and Spread for a Spectra
###   Object
### Aliases: surveySpectra surveySpectra2
### Keywords: hplot

### ** Examples


data(SrE.IR)
myt <- expression(bolditalic(Serenoa)~bolditalic(repens)~bold(Extract~IR~Spectra))
surveySpectra(SrE.IR, method = "iqr", main = myt)
surveySpectra2(SrE.IR, method = "iqr", main = myt)




