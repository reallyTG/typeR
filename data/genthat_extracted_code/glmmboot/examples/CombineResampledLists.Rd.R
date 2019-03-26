library(glmmboot)


### Name: CombineResampledLists
### Title: When running BootGlmm in distributed fashion, combines output
### Aliases: CombineResampledLists

### ** Examples

## No test: 
  data(test_data)
  library(glmmTMB)
  ## where subj is some RE
  test_model <- glmmTMB(y ~ x_var1 + (1 | subj), data = test_data, family = binomial)
  output_list1 <- BootGlmm(test_model, 99, base_data = test_data, return_coefs_instead = TRUE)
  output_list2 <- BootGlmm(test_model, 100, base_data = test_data, return_coefs_instead = TRUE)
  output_list3 <- BootGlmm(test_model, 100, base_data = test_data, return_coefs_instead = TRUE)
  CombineResampledLists(output_list1, output_list2, output_list3)

  num_blocks = 10
  num_total_resamples = 299
  reg_list <- list()
  for(i in 1:num_blocks){
      if(i < num_blocks){
          block_resamples = floor((num_total_resamples + 1)/num_blocks)
      } else {
          block_resamples = floor((num_total_resamples + 1)/num_blocks - 1)
      }
      reg_list[[i]] = BootGlmm(test_model,
                               resamples = block_resamples,
                               base_data = test_data,
                               return_coefs_instead = TRUE,
                               num_cores = 1, ## increase for parallel
                               suppress_loading_bar = TRUE)
  }
  boot_ci1 <- CombineResampledLists(reg_list)
  full_list <- CombineResampledLists(reg_list, return_combined_list = TRUE)
  boot_ci2 <- BootCI(full_list$base_coef_se, full_list$resampled_coef_se)
  identical(boot_ci1, boot_ci2)
## End(No test)



