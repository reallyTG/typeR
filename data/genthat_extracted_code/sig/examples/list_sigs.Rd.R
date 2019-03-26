library(sig)


### Name: list_sigs
### Title: List the signatures of all functions
### Aliases: list_sigs list_sigs.character list_sigs.default
###   list_sigs.environment

### ** Examples

#From a package
list_sigs(pkg2env(graphics))
#Just functions beginning with 'a'.
list_sigs(pkg2env(graphics), pattern = "^a")
#From a file
list_sigs(system.file("extdata", "sample.R", package = "sig"))



