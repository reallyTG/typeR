library(tsDyn)


### Name: STAR
### Title: STAR model
### Aliases: STAR star
### Keywords: ts

### ** Examples

mod.star <- star(log10(lynx), mTh=c(0,1), control=list(maxit=3000))
mod.star

addRegime(mod.star)



