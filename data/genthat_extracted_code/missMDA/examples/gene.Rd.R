library(missMDA)


### Name: gene
### Title: Gene expression
### Aliases: gene
### Keywords: datasets

### ** Examples

## Not run: 
##D data(gene)
##D res.impute <- imputeMFA(gene[,-1], group = c(76,356), 
##D     type = rep("s",2), ncp = 2) 
##D res.mfa <- MFA(cbind.data.frame(gene[,1], res.impute$completeObs), 
##D       group = c(1,76,356), type=c("n",rep("s",2)), 
##D 	  name.group = c("WHO","CGH","expr"), num.group.sup = 1)
##D plot(res.mfa, habillage = 1, lab.ind = FALSE)
##D plot(res.mfa, habillage = "group", invisible = "ind", partial = "all")
##D plot(res.mfa, habillage = "group", lab.ind = FALSE, partial = "all")
##D plot(res.mfa, choix = "var", habillage = "group", lab.var = FALSE)
##D plot(res.mfa, choix = "group", habillage = "group")
## End(Not run)



