library(equateIRT)


### Name: summary.ceqc
### Title: Summarizing Estimated Chain Equating Coefficients
### Aliases: summary.ceqc print.summary.ceqc

### ** Examples

# two-parameter logistic model
# direct equating coefficients using the "Haebara" method
data(est2pl)
test<-paste("test", 1:5, sep = "")
mod2pl <- modIRT(coef = est2pl$coef, var = est2pl$var, names = test, display = FALSE)
direclist2pl <- alldirec(mods = mod2pl, method = "Haebara")
# compute all chain equating coefficients of length 3
chainec3 <- chainec(r = 3, direclist = direclist2pl)
summary(chainec3$test1.test5.test4)	



