library(mrgsolve)


### Name: read_nmext
### Title: Extract estimates from NONMEM ext file
### Aliases: read_nmext

### ** Examples

project <- system.file("nonmem", package = "mrgsolve")

est <- read_nmext(1005, project = project)

est$theta

est$omega

est$sigma




