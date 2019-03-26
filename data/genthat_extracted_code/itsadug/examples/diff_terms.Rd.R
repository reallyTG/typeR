library(itsadug)


### Name: diff_terms
### Title: Compare the formulas of two models and return the difference(s).
### Aliases: diff_terms

### ** Examples

data(simdat)

# Fit simple GAM model:
gam1 <- bam(Y ~ s(Time), data=simdat)
gam2 <- bam(Y ~ Group+s(Time), data=simdat)
diff_terms(gam1, gam2)




