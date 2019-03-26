library(dplR)


### Name: tridas.vocabulary
### Title: Browse and Check Standard TRiDaS Vocabulary
### Aliases: tridas.vocabulary
### Keywords: utilities

### ** Examples
## Show all entries in category "measuring method"
tridas.vocabulary(category = "measuring")

## Show item number one in category "complex presence / absence"
tridas.vocabulary(category = "complex", idx = 1)

## Check whether "half section" exists in category "shape"
tridas.vocabulary(category = "shape", term = "half section",
                  match.exact = TRUE)

## Return unabbreviated matches to several queries in category "remark"
tridas.vocabulary(category = "remark",
                  term = c("trauma", "fire", "diffuse"))



