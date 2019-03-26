library(autovarCore)


### Name: run_var
### Title: Calculate the VAR model and apply restrictions
### Aliases: run_var

### ** Examples

endo_matrix <- matrix(rnorm(120), ncol = 2, nrow = 60,
                      dimnames = list(NULL, c("rumination", "activity")))
autovarCore:::run_var(endo_matrix, NULL, 1)



