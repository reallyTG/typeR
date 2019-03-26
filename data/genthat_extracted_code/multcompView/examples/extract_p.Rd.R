library(multcompView)


### Name: extract_p
### Title: Extracts p-values
### Aliases: extract_p extract_p.TukeyHSD extract_p.default extract_p.mc
### Keywords: array manip

### ** Examples

experiment <- data.frame(treatments = gl(11, 20, labels = c("dtl", "ctrl", "treat1",
              "treat2", "treatA2", "treatB", "treatB2",
              "treatC", "treatD", "treatA1", "treatX")),
              y = c(rnorm(20, 10, 5), rnorm(20, 20, 5), rnorm(20, 22, 5), rnorm(20, 24, 5),
               rnorm(20, 35, 5), rnorm(20, 37, 5), rnorm(20, 40, 5), rnorm(20, 43, 5),
               rnorm(20, 45, 5), rnorm(20, 60, 5), rnorm(20, 60, 5)))
exp_tukey <- TukeyHSD(exp_aov <- aov(y  ~ treatments, data = experiment))

extract_p(exp_tukey)

require(pgirmess)
extract_p(kruskalmc(y ~ treatments, data = experiment))



