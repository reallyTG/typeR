library(equateIRT)


### Name: summary.ceqclist
### Title: Summarizing a List of Estimated Chain Equating Coefficients
### Aliases: summary.ceqclist print.summary.ceqclist

### ** Examples

# two-parameter logistic model
# direct equating coefficients using the "Haebara" method
data(est2pl)
test<-paste("test", 1:5, sep = "")
mod2pl <- modIRT(coef = est2pl$coef, var = est2pl$var, names = test, display = FALSE)
direclist2pl <- alldirec(mods = mod2pl, method = "Haebara")
# compute all chain equating coefficients of length 3
chainec3 <- chainec(r = 3, direclist = direclist2pl)
summary(chainec3)	
summary(chainec3, path = "test1.test2.test3")	
summary(chainec3, path = c("test1.test2.test3","test1.test5.test4"))	



