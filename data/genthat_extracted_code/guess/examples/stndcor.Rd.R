library(guess)


### Name: stndcor
### Title: Standard Guessing Correction for Learning
### Aliases: stndcor

### ** Examples

pre_test <- data.frame(item1=c(1,0,0,1,0), item2=c(1,NA,0,1,0)); 
pst_test <- pre_test + cbind(c(0,1,1,0,0), c(0,1,0,0,1))
lucky <- rep(.25, 2); stndcor(pre_test, pst_test, lucky)



