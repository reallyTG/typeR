## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.align = 'center'
)
library("JointAI")

## ---- echo = F-----------------------------------------------------------
tab <- rbind(
c("`analysis_main`", "`betas`, `tau_y` and `sigma_y`"),
c("`analysis_random`", "`ranef`, `D`, `invD`, `RinvD`"),
c('`imp_pars`', '`alphas`, `tau_imp`, `gamma_imp`, `delta_imp`'),
c('`imps`', 'imputed values'),
c('`betas`', 'regression coefficients of the analysis model'),
c('`tau_y`', 'precision of the residuals from the analysis model'),
c('`sigma_y`', 'standard deviation of the residuals from the analysis model'),
c('`ranef`', 'random effects'),
c('`D`', 'covariance matrix of the random effects'),
c('`invD`', 'inverse of `D`'),
c('`RinvD`', 'scale matrix in Wishart prior for `invD`'),
c('`alphas`', 'regression coefficients in the imputation models'),
c('`tau_imp`', 'precision parameters of the residuals from imputation models'),
c('`gamma_imp`', 'intercepts in ordinal imputation models'),
c('`delta_imp`', 'increments of ordinal intercepts'),
c('`other`', 'additional parameters')
)
colnames(tab) = c('name/key word', 'what is monitored')

knitr::kable(tab)

## ----lm1_1---------------------------------------------------------------
lm1 <- lm_imp(SBP ~ gender + WC + alc + creat, data = NHANES, 
              n.adpat = 0, mess = FALSE)

parameters(lm1, mess = FALSE)

## ----lm2_1---------------------------------------------------------------
lm2 <- lm_imp(SBP ~ age + WC + alc + smoke + occup,
              data = NHANES, n.adapt = 0, mess = FALSE,
              monitor_params = c(imps = TRUE, analysis_main = FALSE)
)

parameters(lm2, mess = FALSE)

## ----lm3_1---------------------------------------------------------------
lm3 <- lm_imp(SBP ~ age + WC + alc + smoke + occup,
              data = NHANES, n.adapt = 0, mess = FALSE,
              monitor_params = c(imp_pars = TRUE, analysis_main = FALSE),
)

parameters(lm3, mess = FALSE)

## ----list_lm2------------------------------------------------------------
list_impmodels(lm2)

## ---- echo = FALSE-------------------------------------------------------
tab <- rbind(object = 'a JointAI object',
             m = "number of datasets to be created",
             include = "logical; should the original data be included?",
             start = paste0("the first iteration that may be randomly chosen",
                            " (i.e., all previous iterations are discarded as burn-in)"),
             minspace = 'minimum number of iterations between iterations chosen as imputed values',
             seed = "optional seed value in order to make the random selection
                     of iterations reproducible",
             export_to_SPSS = paste0("logical; should the datasets be exported", 
                                     " to SPSS, i.e., written as .txt and .sps file? ",
                                     "If `export_to_SPSS = FALSE` (default) the",
                                     " imputed data is only returned `data.frame`"),
             resdir = 'directory the files are exported to',
             filename = 'the name of the .txt and .sps files') 

tab <- cbind(paste0("`", rownames(tab), "`"), tab)
colnames(tab) <- c('argument', 'explanation')

knitr::kable(tab, row.names = FALSE)

## ------------------------------------------------------------------------
lme1 <- lme_imp(bmi ~ age + EDUC, random = ~age | ID, 
                data = simLong, n.adapt = 0, mess = FALSE)

parameters(lme1, mess = FALSE)

## ------------------------------------------------------------------------
lme2 <- lme_imp(bmi ~ age + EDUC, random = ~age | ID,
                data = simLong, n.adapt = 0, mess = FALSE,
                monitor_params = c(analysis_random = TRUE))

parameters(lme2, mess = FALSE)

## ------------------------------------------------------------------------
lme3a <- lme_imp(bmi ~ age + EDUC, random = ~age | ID,
                data = simLong, n.adapt = 0, mess = FALSE,
                monitor_params = c(analysis_main = TRUE, RinvD = TRUE))

parameters(lme3a, mess = FALSE)

## ------------------------------------------------------------------------
lme3b <- lme_imp(bmi ~ age + EDUC, random = ~age | ID,
                data = simLong, n.adapt = 0, mess = FALSE,
                monitor_params = c(analysis_main = TRUE,
                                   analysis_random = TRUE,
                                   RinvD = FALSE,
                                   ranef = FALSE))

parameters(lme3b, mess = FALSE)

## ------------------------------------------------------------------------
lm4 <- lm_imp(SBP ~ gender + WC + alc + creat,
              data = NHANES, n.adapt = 0, mess = FALSE, progress.bar = 'none',
              monitor_params = list(analysis_main = FALSE,
                                    other = c('p_alc[1:3]', "mu_creat[1]")))

parameters(lm4)

## ---- fig.width = 7, fig.height = 6, cache = TRUE------------------------
# Run a model monitoring analysis parameters and imputation parameters
lm5 <- lm_imp(SBP ~ gender + WC + alc + creat,
              data = NHANES, n.iter = 100, mess = FALSE, progress.bar = 'none',
              monitor_params = c(imp_pars = TRUE))

# model summary
summary(lm5)

# traceplot of the MCMC sample
traceplot(lm5)

# density plot of the MCMC sample
densplot(lm5)

# Gelman-Rubin criterion
GR_crit(lm5)

# Monte Carlo Error of the MCMC sample
MC_error(lm5)

## ---- cache = TRUE, fig.height = 1.5-------------------------------------
# Re-run the model from above, now creating MCMC samples
lm4 <- lm_imp(SBP ~ gender + WC + alc + creat,
              data = NHANES, n.iter = 100, mess = FALSE,  progress.bar = 'none',
              monitor_params = list(analysis_main = FALSE,
                                    other = c('p_alc[1:3]', "mu_creat[1]")))

traceplot(lm4, ncol = 4)

## ----GRcrit_lm5----------------------------------------------------------
# we use lm5 from above
GR_crit(lm5, subset = c(analysis_main = FALSE, imp_pars = TRUE))

## ----trace_lm5, fig.width = 5, fig.height = 2, out.width = "60%"---------
summary(lm5, subset = list(other = c('creat', 'alc>=1')))

## ----lm2_2, cache = TRUE, fig.height = 2, fig.width = 5, out.width = "60%"----
# Re-run the model from above, now creating MCMC samples
lm2 <- lm_imp(SBP ~ age + WC + alc + smoke + occup,
              data = NHANES, n.iter = 100, mess = FALSE,  progress.bar = 'none',
              monitor_params = c(imps = TRUE, analysis_main = FALSE),
)

# select only imputed values for 'WC' (3rd column of Xc)
sub3 <- grep('Xc\\[[[:digit:]]+,3\\]', parameters(lm2), value = TRUE)
sub3

traceplot(lm2, subset = list(other = sub3), ncol = 2)

## ---- fig.height = 4-----------------------------------------------------
lme4 <- lme_imp(bmi ~ age + EDUC, random = ~age|ID,
                data = simLong, n.iter = 100, mess = FALSE, progress.bar = 'none',
                monitor_params = c(analysis_main = FALSE, ranef = TRUE))

# exract random intercepts
ri <- grep('^b\\[[[:digit:]]+,1\\]$', colnames(lme4$MCMC[[1]]), value = T)

# extract random slopes
rs <- grep('^b\\[[[:digit:]]+,2\\]$', colnames(lme4$MCMC[[1]]), value = T)

# plot the chains of 8 randomly selected random intercepts
traceplot(lme4, subset = list(other = sample(ri, size = 8)), ncol = 4)

# plot the chains of 8 randomly selected random slopes
traceplot(lme4, subset = list(other = sample(rs, size = 8)), ncol = 4)

