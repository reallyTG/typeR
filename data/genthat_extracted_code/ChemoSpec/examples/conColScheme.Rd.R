library(ChemoSpec)


### Name: conColScheme
### Title: Change the Color Scheme of a Spectra Object
### Aliases: conColScheme
### Keywords: color utilities

### ** Examples


data(metMUD1)
sumSpectra(metMUD1)
newSpec <- conColScheme(metMUD1, new = c("pink", "violet"))
sumSpectra(newSpec)




