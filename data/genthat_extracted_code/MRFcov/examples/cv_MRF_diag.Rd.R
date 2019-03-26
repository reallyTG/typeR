library(MRFcov)


### Name: cv_MRF_diag
### Title: MRF cross validation and assessment of predictive performance
### Aliases: cv_MRF_diag cv_MRF_diag_rep cv_MRF_diag_rep_spatial

### ** Examples

## No test: 
data("Bird.parasites")
# Generate boxplots of model predictive metrics
cv_MRF_diag(data = Bird.parasites, n_nodes = 4,
           n_cores = 3, family = 'binomial')

# Generate boxplots comparing the CRF to an MRF model (no covariates)
cv_MRF_diag(data = Bird.parasites, n_nodes = 4,
           n_cores = 3, family = 'binomial',
           compare_null = TRUE)

# Replicate 10-fold cross-validation 100 times
cv.preds <- cv_MRF_diag_rep(data = Bird.parasites, n_nodes = 4,
                           n_cores = 3, family = 'binomial',
                           compare_null = TRUE,
                           plot = FALSE, n_fold_runs = 100)

# Plot model sensitivity and % true predictions
library(ggplot2)
gridExtra::grid.arrange(
 ggplot(data = cv.preds, aes(y = mean_sensitivity, x = model)) +
       geom_boxplot() + theme(axis.text.x = ggplot2::element_blank()) +
       labs(x = ''),
 ggplot(data = cv.preds, aes(y = mean_tot_pred, x = model)) +
       geom_boxplot(),
       ncol = 1,
 heights = c(1, 1))

# Create some sample Poisson data with strong correlations
cov <- rnorm(500, 0.2)
cov2 <- rnorm(500, 4)
sp.2 <- ceiling(rnorm(500, 1)) + (cov * 2)
sp.2[sp.2 < 0] <- 0
poiss.dat <- data.frame(sp.1 = ceiling(rnorm(500, 1) + cov2 * 1.5),
                       sp.2 = sp.2, sp.3 = (sp.2 * 2) + ceiling(rnorm(500, 0.1)))
poiss.dat[poiss.dat < 0] <- 0
poiss.dat$cov <- cov
poiss.dat$cov2 <- cov2

# A CRF should produce a better fit (lower deviance, lower MSE)
cvMRF.poiss <- cv_MRF_diag(data = poiss.dat, n_nodes = 3,
                          n_folds = 10,
                          family = 'poisson',
                          compare_null = TRUE, plot = TRUE)
## End(No test)




