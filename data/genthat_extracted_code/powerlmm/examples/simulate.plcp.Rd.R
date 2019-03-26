library(powerlmm)


### Name: simulate.plcp
### Title: Perform a simulation study using a 'study_parameters'-object
### Aliases: simulate.plcp simulate.plcp_multi

### ** Examples

## Not run: 
##D # Two-level ---------------------------------------------------------------
##D p <- study_parameters(n1 = 11,
##D                       n2 = 25,
##D                       sigma_subject_intercept = 1.44,
##D                       sigma_subject_slope = 0.2,
##D                       sigma_error = 1.44,
##D                       effect_size = cohend(0.5))
##D 
##D f <- sim_formula("y ~ treatment * time + (1 + time | subject)")
##D 
##D 
##D res <- simulate(object = p,
##D                 nsim = 1000,
##D                 formula = f,
##D                 satterthwaite = TRUE,
##D                 progress = FALSE,
##D                 cores = 1,
##D                 save = FALSE)
##D 
##D summary(res)
##D 
##D 
##D # Three-level (nested) ------------------------------------------------------
##D p <- study_parameters(n1 = 10,
##D                       n2 = 20,
##D                       n3 = 4,
##D                       sigma_subject_intercept = 1.44,
##D                       icc_pre_cluster = 0,
##D                       sigma_subject_slope = 0.2,
##D                       icc_slope = 0.05,
##D                       sigma_error = 1.44,
##D                       effect_size = 0)
##D 
##D ## compare correct and miss-specified model
##D f0 <- "y ~ treatment * time + (1 + time | subject)"
##D f1 <- "y ~ treatment * time + (1 + time | subject) + (0 + time | cluster)"
##D f <- sim_formula_compare("correct" = f1,
##D                          "wrong" = f0)
##D 
##D res <- simulate(object = p,
##D                 nsim = 1000,
##D                 formula = f,
##D                 satterthwaite = TRUE,
##D                 progress = FALSE,
##D                 cores = 1,
##D                 save = FALSE)
##D 
##D summary(res)
##D 
##D ## Compare random effects using LRT,
##D ## summarise based on best model from each sim
##D summary(res,
##D         model_selection = "FW",
##D         LRT_alpha = 0.1,
##D         para = "treatment:time")
##D 
##D # Partially nested design ---------------------------------------------------
##D p <- study_parameters(n1 = 11,
##D                       n2 = 10,
##D                       n3 = 4,
##D                       sigma_subject_intercept = 1.44,
##D                       icc_pre_cluster = 0,
##D                       sigma_subject_slope = 0.2,
##D                       cor_subject = -0.5,
##D                       icc_slope = 0.05,
##D                       sigma_error = 1.44,
##D                       partially_nested = TRUE,
##D                       effect_size = cohend(-0.5))
##D 
##D f <- sim_formula("y ~ treatment * time + (1 + time | subject) +
##D                   (0 + treatment:time | cluster)")
##D 
##D res <- simulate(object = p,
##D                 nsim = 1000,
##D                 formula = f,
##D                 satterthwaite = TRUE,
##D                 progress = FALSE,
##D                 cores = 4,
##D                 save = FALSE)
##D 
##D summary(res)
##D 
##D # Run multiple designs  -----------------------------------------------------
##D p <- study_parameters(n1 = 10,
##D                       n2 = 20,
##D                       n3 = c(2, 4, 6),
##D                       sigma_subject_intercept = 1.44,
##D                       icc_pre_cluster = 0,
##D                       sigma_subject_slope = 0.2,
##D                       icc_slope = 0.05,
##D                       sigma_error = 1.44,
##D                       effect_size = cohend(0.5))
##D 
##D f0 <- "y ~ treatment * time + (1 + time | subject)"
##D f1 <- "y ~ treatment * time + (1 + time | subject) + (0 + time | cluster)"
##D f <- sim_formula_compare("correct" = f1,
##D                          "wrong" = f0)
##D 
##D res <- simulate(object = p,
##D                 nsim = 1000,
##D                 formula = f,
##D                 satterthwaite = TRUE,
##D                 progress = FALSE,
##D                 cores = 1,
##D                 save = FALSE)
##D 
##D # Summarize 'time:treatment' results for n3 = c(2, 4, 6) for 'correct' model
##D summary(res, para = "time:treatment", model = "correct")
##D 
##D # Summarize cluster-level random slope  for n3 = c(2, 4, 6) for 'correct' model
##D summary(res, para = "cluster_slope", model = "correct")
## End(Not run)



