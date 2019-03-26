library(guess)


### Name: transmat
### Title: transmat: Cross-wave transition matrix
### Aliases: transmat

### ** Examples

pre_test_var <- c(1,0,0,1,0,1,0)
pst_test_var <- c(1,0,1,1,0,1,1)
transmat(pre_test_var, pst_test_var)

# With NAs
pre_test_var <- c(1,0,0,1,"d","d",0,1,NA)
pst_test_var <- c(1,NA,1,"d",1,0,1,1,"d") 
transmat(pre_test_var, pst_test_var)



