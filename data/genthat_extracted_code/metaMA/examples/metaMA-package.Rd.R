library(metaMA)


### Name: metaMA-package
### Title: Meta-analysis for MicroArrays
### Aliases: metaMA-package metaMA
### Keywords: package

### ** Examples

library(metaMA)
data(Singhdata)
EScombination(esets=Singhdata$esets,classes=Singhdata$classes)
pvalcombination(esets=Singhdata$esets,classes=Singhdata$classes)
#more details are provided in the vignette; only open it in interactive R sessions
if(interactive()){
  vignette("metaMA")
  }



