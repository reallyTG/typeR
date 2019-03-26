library(equateIRT)


### Name: eqc
### Title: Extract Equating Coefficients
### Aliases: eqc eqc.eqc eqc.eqclist eqc.ceqc eqc.ceqclist eqc.meqc

### ** Examples

# two-parameter logistic model
data(est2pl)
test<-paste("test", 1:5, sep = "")
mod2pl <- modIRT(coef = est2pl$coef, var = est2pl$var, names = test, display = FALSE)
# direct equating coefficients between forms 1 and 2 using the Haebara method
l12 <- direc(mods = mod2pl, which = c(1,2), method = "Haebara")
# all direct equating coefficients using the Haebara method
direclist2pl <- alldirec(mods = mod2pl, method = "Haebara")
# compute all chain equating coefficients of length 3
chainec3 <- chainec(r = 3, direclist = direclist2pl)
# compute chain equating coefficients for path 1,2,3,4
pth1 <- paste("test", 1:4, sep = "")
chainec1 <- chainec(direclist = direclist2pl, pths = pth1)
# compute chain equating coefficients for path 1,5,4
pth2 <- c(paste("test", c(1,5,4), sep = ""))
chainec2 <- chainec(direclist = direclist2pl, pths = pth2)
# create a list of objects of class ceqc
ecall <- c(chainec1, chainec2)
# compute bisector and weighted bisector coefficients
allec <- bisectorec(ecall = ecall, weighted = TRUE, unweighted = TRUE)

# extract equating coefficients
eqc(l12)
eqc(direclist2pl)
eqc(direclist2pl, link = "test1.test2")
eqc(chainec3)
eqc(chainec3, link = "test1.test3")
eqc(allec)
eqc(allec, path = "bisector")



