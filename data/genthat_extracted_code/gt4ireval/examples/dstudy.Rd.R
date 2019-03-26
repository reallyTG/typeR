library(gt4ireval)


### Name: dstudy
### Title: D-study (Decision)
### Aliases: dstudy

### ** Examples

g <- gstudy(adhoc3)
dstudy(g)

# estimate stability at various query set sizes
dstudy(g, queries = seq(50, 200, 10))
# estimate required query set sizes for various stability levels
dstudy(g, stability = seq(0.8, 0.95, 0.01))
# compute both 95% and 99% confidence intervals
dstudy(g, stability = 0.9, alpha = c(0.05, 0.01) / 2)
# compute 1-tailed 95% confidence intervals
dstudy(g, alpha = 0.05)



