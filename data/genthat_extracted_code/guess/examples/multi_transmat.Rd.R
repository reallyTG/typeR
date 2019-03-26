library(guess)


### Name: multi_transmat
### Title: Creates a transition matrix for each item.
### Aliases: multi_transmat

### ** Examples

pre_test <- data.frame(pre_item1=c(1,0,0,1,0), pre_item2=c(1,NA,0,1,0)) 
pst_test <- data.frame(pst_item1=pre_test[,1] + c(0,1,1,0,0), 
					  pst_item2 = pre_test[,2] + c(0,1,0,0,1))
multi_transmat(pre_test, pst_test)



