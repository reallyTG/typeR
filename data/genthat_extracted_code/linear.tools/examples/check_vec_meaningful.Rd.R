library(linear.tools)


### Name: check_vec_meaningful
### Title: check x is a meaningful vector
### Aliases: check_vec_meaningful
### Keywords: internal

### ** Examples


check_vec_meaningful(c(NA,NA)) # NOT PASS

tryCatch(check_vec_meaningful(x=list(NA,NaN)),
         error = function(err){
           print(err)
           }
         )# NOT PASS

check_vec_meaningful(c(NA,1)) # PASS
check_vec_meaningful(c(NULL,1)) # PASS
check_vec_meaningful(factor(c(NA,1,1))) # PASS
check_vec_meaningful(1) # PASS
check_vec_meaningful('1') # PASS




