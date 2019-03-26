library(episensr)


### Name: %>%
### Title: Pipe bias functions
### Aliases: %>%

### ** Examples

# Instead of
misclassification(matrix(c(118, 832, 103, 884),
dimnames = list(c("BC+", "BC-"), c("AD+", "AD-")), nrow = 2, byrow = TRUE),
type = "exposure", bias_parms = c(.56, .58, .99, .97))
# you can write
dat <- matrix(c(118, 832, 103, 884),
dimnames = list(c("BC+", "BC-"), c("AD+", "AD-")), nrow = 2, byrow = TRUE)
dat %>% misclassification(., type = "exposure", bias_parms = c(.56, .58, .99, .97))
# also for multiple bias:
dat %>%
misclassification(., type = "exposure", bias_parms = c(.56, .58, .99, .97)) %>%
multiple.bias(., bias_function = "selection", bias_parms = c(.73, .61, .82, .76))



