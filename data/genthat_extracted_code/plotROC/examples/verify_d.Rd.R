library(plotROC)


### Name: verify_d
### Title: Check that D is suitable for using as binary disease status
### Aliases: verify_d

### ** Examples


verify_d(c(1, 0, 1))
## Not run: 
##D verify_d(c(TRUE, FALSE, TRUE)) #warning
##D verify_d(c("Dead", "Alive", "Dead")) #warning
##D verify_d(c("Disease", "Healthy", "Missing")) #error
## End(Not run)




