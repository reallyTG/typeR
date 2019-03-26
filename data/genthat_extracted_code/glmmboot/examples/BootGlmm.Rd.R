library(glmmboot)


### Name: BootGlmm
### Title: computes bootstrap resamples of your data, stores estimates +
###   SEs.
### Aliases: BootGlmm

### ** Examples

x <- rnorm(20)
y <- rnorm(20) + x
xy_data = data.frame(x = x, y = y)
first_model <- lm(y ~ x, data = xy_data)

out_matrix <- BootGlmm(first_model, 20, base_data = xy_data)
out_list <- BootGlmm(first_model, 20, base_data = xy_data, return_coefs_instead = TRUE)

## No test: 
  data(test_data)
  library(glmmTMB)
  test_formula <- as.formula('y ~ x_var1 + x_var2 + x_var3 + (1|subj)')
  test_model <- glmmTMB(test_formula, data = test_data, family = binomial)
  output_matrix <- BootGlmm(test_model, 199, base_data = test_data)

  output_lists <- BootGlmm(test_model, 199, base_data = test_data, return_coefs_instead = TRUE)
## End(No test)



