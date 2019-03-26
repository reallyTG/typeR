context("test-anova-block.R")
test_that("manyglm block anova ", {
  # from the example(anova.manyglm) 
  ### Load the Tasmania data set
  rep.seed <- TRUE
  data(Tasmania)
  nBoot <- 199
  ## Visualise the effect of treatment on copepod abundance
  tasm.cop <- mvabund(Tasmania$copepods)
  treatment <- Tasmania$treatment
  block <- Tasmania$block

  ## Fitting predictive models using a negative binomial model for counts:
  tasm.cop.nb <- manyglm(tasm.cop ~ block*treatment, family="negative.binomial")
  # test just using the normal distribution
  # note this would be inappropriate to do normally but we are trying to test block resampling
  tasm.cop <- manylm(tasm.cop ~ block*treatment)

  ## Testing hypotheses about the treatment effect and treatment-by-block interactions,
  ## using a Wald statistic and 199 resamples (better to ramp up to 999 for a paper):
  aglm <- anova(tasm.cop.nb, nBoot=nBoot, test="LR", show.time='none', block = block, rep.seed=T)
  alm <- anova(tasm.cop, nBoot=nBoot, test="LR", block = block, rep.seed=T)
  expect_equal_to_reference(cbind(aglm$table[,3],alm$table[,3]), 'block_anova_resampling.rds')
  sglm <- summary(tasm.cop.nb, nBoot = nBoot, block = block, rep.seed = T)
  slm <- summary(tasm.cop, nBoot = nBoot, block = block, rep.seed = T)
    
  expect_equal_to_reference(cbind(coef(slm)[,1], coef(sglm)[,1]), 'block_summary_resampling.rds')

  if(interactive()) {
    cat('print summaries: sglm \n')
    print(sglm)
    cat('print summaries: slm\n')
    print(slm)
    cat('print anova: aglm\n')
    print(aglm)
    cat('print anova: alm\n')
    print(alm)
  }
})
