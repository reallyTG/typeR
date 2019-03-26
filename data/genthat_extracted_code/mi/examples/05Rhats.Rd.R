library(mi)


### Name: 05Rhats
### Title: Convergence Diagnostics
### Aliases: Rhats 05Rhats mi2BUGS
### Keywords: manip AimedAtUseRs

### ** Examples

if(!exists("imputations", env = .GlobalEnv)) {
  imputations <- mi:::imputations # cached from example("mi-package")
}
  dim(mi2BUGS(imputations))
  Rhats(imputations)



