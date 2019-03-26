library(bgsmtr)


### Name: bgsmtr
### Title: Bayesian Group Sparse Multi-Task Regression for Imaging Genetics
### Aliases: bgsmtr

### ** Examples

data(bgsmtr_example_data)
names(bgsmtr_example_data)
## Don't show: 
## Toy example with a small subset of the data for routine CRAN testing
## reduce the number of SNPs to 5, subjects to 5, phenotypes to 5
fit = bgsmtr(X = bgsmtr_example_data$SNP_data[1:5,1:5], Y = bgsmtr_example_data$BrainMeasures[1:5,1:5],
group = bgsmtr_example_data$SNP_groups[1:5], tuning = 'WAIC', lam_1_fixed = 2, lam_2_fixed = 2,
iter_num = 5, burn_in = 1)
## End(Don't show)

## Not run: 
##D ## test run the sampler for 100 iterations with fixed tunning parameters and compute WAIC
##D ## we recomend at least 5,000 iterations for actual use
##D fit = bgsmtr(X = bgsmtr_example_data$SNP_data, Y = bgsmtr_example_data$BrainMeasures,
##D group = bgsmtr_example_data$SNP_groups, tuning = 'WAIC', lam_1_fixed = 2, lam_2_fixed = 2,
##D iter_num = 100, burn_in = 50)
##D ## posterior mean for regression parameter relating 100th SNP to 14th phenotype
##D fit$Gibbs_W_summaries$W_post_mean[100,14]
##D ## posterior mode for regression parameter relating 100th SNP to 14th phenotype
##D fit$Gibbs_W_summaries$W_post_mode[100,14]
##D ## posterior standard deviation for regression parameter relating 100th SNP to 14th phenotype
##D fit$Gibbs_W_summaries$W_post_sd[100,14]
##D ## 95% equal-tail credible interval for regression parameter relating 100th SNP to 14th phenotype
##D c(fit$Gibbs_W_summaries$W_2.5_quantile[100,14],fit$Gibbs_W_summaries$W_97.5_quantile[100,14])
## End(Not run)

## Not run: 
##D ## run the sampler for 10,000 iterations with tuning parameters set using cross-validation
##D ## On a standard computer with a small numer of cores this is the recomended option
##D fit = bgsmtr(X = bgsmtr_example_data$SNP_data, Y = bgsmtr_example_data$BrainMeasures,
##D group = bgsmtr_example_data$SNP_groups, tuning = 'CV.mode',iter_num = 10000, burn_in = 5000)
## End(Not run)




