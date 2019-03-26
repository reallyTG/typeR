library(confinterpret)


### Name: plot.interpretation_result
### Title: Plot an interpretation_result, as returned by confinterpret()
### Aliases: plot.interpretation_result

### ** Examples

# Set a nice colour scheme
grDevices::palette(c("#FF671F99", "#F2A90099", "#0085CA99"))
# Set up a confidence interval to interpret
ci_test <- matrix(c(-0.03, 0.05),
                  nrow = 1,
                  dimnames = list("estimate", c("2.5 %", "97.5 %")))
noninf <- interpret_noninferiority(ci_test, 0, 0.05, c("Treatment as usual",
                                                       "New treatment"))
plot(noninf)




