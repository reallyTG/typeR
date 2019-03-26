library(randomLCA)


### Name: uterinecarcinoma
### Title: Uterine Carcinoma Data
### Aliases: uterinecarcinoma
### Keywords: datasets

### ** Examples

## Not run: 
##D uterinecarcinoma.lcarandom2 <- randomLCA(uterinecarcinoma[,1:7],
##D   freq=uterinecarcinoma$freq,random=TRUE,probit=TRUE,quadpoints=61)
##D # LCR1 model of Que et al. This is fairly unstable and 
##D # is also slow and doesn't improve the model fit
##D uterinecarcinoma.lcarandom2by <- randomLCA(uterinecarcinoma[,1:7],freq=uterinecarcinoma$freq,
##D 	byclass=TRUE,random=TRUE,probit=TRUE,quadpoints=71)
## End(Not run)



