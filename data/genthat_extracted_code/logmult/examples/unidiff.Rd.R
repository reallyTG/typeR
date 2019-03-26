library(logmult)


### Name: unidiff
### Title: Fitting Log-Multiplicative Uniform Difference/Layer Effect Model
### Aliases: unidiff
### Keywords: models nonlinear

### ** Examples

  ## Yaish (1998, 2004)
  data(yaish)

  # Last layer omitted because of low frequencies
  yaish <- yaish[,,-7]

  # Layer (education) must be the third dimension
  yaish <- aperm(yaish, 3:1)

  model <- unidiff(yaish)

  model
  summary(model)
  plot(model)

  ## Don't show: 
      # The last layer coefficient can sometimes be rounded to -2.249 without this, which breaks the test
      model <- unidiff(yaish, weighting="uniform", tolerance=1e-8)

      stopifnot(all.equal(round(model$deviance, 3), 200.326))
      stopifnot(all.equal(model$df.residual, 116))
      stopifnot(all.equal(round(model$unidiff$layer$qvframe$estimate, 3),
                          c(0, -0.225, -0.743, -1.039, -2.250)))
      stopifnot(all.equal(round(model$unidiff$phi, 3),
                          c(0.601, 0.48, 0.286, 0.213, 0.063), check.attributes=FALSE))
      stopifnot(all.equal(round(model$unidiff$maor, 3),
                          c(4.144, 3.111, 1.966, 1.654, 1.162), check.attributes=FALSE))
      # Interaction coefficients obtained using LEM
      stopifnot(all.equal(round(model$unidiff$interaction[,1], 4),
                          c(0.7084, -0.5925, -0.1608,  0.9028, -0.5433, -0.3146,  1.1473,
                            0.2729, -0.3248, -1.4509,  0.3526,  0.0029, -0.1734,  0.1755,
                            0.5605, -0.2185, -0.1669, -0.1772, -0.4809, -0.9644,  0.0862,
                            1.9604, -0.6909,  0.0896, -0.9153, -0.0035,  0.2453, -0.414,
                            0.7927,  0.2948, -0.3342,  0.3295,  0.0612, -0.5712,  0.2573,
                            0.2574,  0.0482,  0.7824, -0.4677, -0.2085, -0.0015, -0.153)))


      # Test anova
      indep <- gnm(Freq ~ orig*educ + dest*educ, data=as.table(yaish), family=poisson)
      anova(indep, model, test="LR")
      anova(indep, model, test="Chisq")
  
## End(Don't show)



