library(rEMM)


### Name: score
### Title: Score a New Sequence Given an EMM
### Aliases: score score,EMM,numeric-method score,EMM,data.frame-method
###   score,EMM,matrix-method score,EMM,EMM-method
### Keywords: models

### ** Examples

data("EMMsim")
  
emm <- EMM(threshold=.2)
emm <- build(emm, EMMsim_train)
  
score(emm, EMMsim_test) # default is method "product"
  
  
### create shuffled data (destroy temporal relationship)
### and create noisy data
test_shuffled <- EMMsim_test[sample(1:nrow(EMMsim_test)),]
test_noise <- jitter(EMMsim_test, amount=.3)
  
### helper for plotting
mybars <- function(...) {
  oldpar <- par(mar=c(5,10,4,2))
  ss <- rbind(...) 
  barplot(ss[,ncol(ss):1], xlim=c(-1,4), beside=TRUE, 
          horiz=TRUE, las=2, 
          legend = rownames(ss))
  par(oldpar)
}
  

### compare various scores
methods <- c("product", 
             "sum", 
             "log_sum", 
             "supported_states", 
             "supported_transitions",
             "sum_transitions",
             "log_loss",
             "likelihood")

### default is exact matching
clean <- sapply(methods, FUN=function(m) score(emm, EMMsim_test, method=m))
shuffled <- sapply(methods, FUN=function(m) score(emm, test_shuffled, method=m))
noise <- sapply(methods, FUN=function(m) score(emm, test_noise, method=m))
mybars(shuffled, noise, clean)
  
### weighted matching is better for noisy data
clean <- sapply(methods, FUN=function(m) score(emm, EMMsim_test, method=m, 
                                               match="weighted"))
shuffled <- sapply(methods, FUN=function(m) score(emm, test_shuffled, method=m, 
                                                  match="weighted"))
noise <- sapply(methods, FUN=function(m) score(emm, test_noise, method=m, 
                                               match="weighted"))
mybars(shuffled, noise, clean)



