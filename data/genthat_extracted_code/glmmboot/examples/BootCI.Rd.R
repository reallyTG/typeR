library(glmmboot)


### Name: BootCI
### Title: Enter first level estimates and second level estimates, get
###   bootstrap interval, from the pivotal bootstrap t (Efron and
###   Tibshirani 1994, also endorsed by Hesterberg 2015).
### Aliases: BootCI

### ** Examples

x <- rnorm(20)
y <- rnorm(20) + x
xy_data = data.frame(x = x, y = y)
first_model <- lm(y ~ x, data = xy_data)
out_list <- BootGlmm(first_model, 20, base_data = xy_data, return_coefs_instead = TRUE)
BootCI(out_list$base_coef_se,
       out_list$resampled_coef_se)

## No test: 
  data(test_data)
  library(glmmTMB)
  ## where subj is some random effect
  test_model <- glmmTMB(y ~ x_var1 + (1 | subj), data = test_data, family = binomial)
  output_lists <- BootGlmm(test_model, 199, base_data = test_data, return_coefs_instead = TRUE)
  BootCI(output_lists$base_coef_se,
         output_lists$resampled_coef_se)
## End(No test)



