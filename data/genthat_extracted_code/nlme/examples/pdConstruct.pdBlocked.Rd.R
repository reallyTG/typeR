library(nlme)


### Name: pdConstruct.pdBlocked
### Title: Construct pdBlocked Objects
### Aliases: pdConstruct.pdBlocked
### Keywords: models

### ** Examples

pd1 <- pdBlocked(list(c("A","B"), c("a1", "a2", "a3")))
pdConstruct(pd1, list(diag(1:2), diag(c(0.1, 0.2, 0.3))))



