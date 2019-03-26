library(mi)


### Name: 07complete
### Title: Extract the Completed Data
### Aliases: 07complete complete complete-methods
### Keywords: manip AimedAtUseRs

### ** Examples

if(!exists("imputations", env = .GlobalEnv)) {
  imputations <- mi:::imputations # cached from example("mi-package")
}
data.frames <- complete(imputations, 3)
lapply(data.frames, summary)



