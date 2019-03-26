library(episensr)


### Name: multiple.bias
### Title: Extract adjusted 2-by-2 table from episensr object
### Aliases: multiple.bias

### ** Examples

dat <- matrix(c(118, 832, 103, 884),
dimnames = list(c("BC+", "BC-"), c("AD+", "AD-")), nrow = 2, byrow = TRUE)
dat %>%
misclassification(., type = "exposure", bias_parms = c(.56, .58, .99, .97)) %>%
multiple.bias(., bias_function = "selection", bias_parms = c(.73, .61, .82, .76))



