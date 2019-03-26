library(mi)


### Name: hist
### Title: Histograms of Multiply Imputed Data
### Aliases: hist hist-methods
### Keywords: hplot AimedAtUseRs methods

### ** Examples

if(!exists("imputations", env = .GlobalEnv)) {
  imputations <- mi:::imputations # cached from example("mi-package")
}
hist(imputations)



