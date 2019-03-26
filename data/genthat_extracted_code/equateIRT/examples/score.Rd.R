library(equateIRT)


### Name: score
### Title: Scoring
### Aliases: score score.eqc score.eqclist score.ceqc score.ceqclist
###   score.meqc

### ** Examples

# two-parameter logistic model
data(est2pl)
test<-paste("test", 1:5, sep = "")
mod2pl <- modIRT(coef = est2pl$coef, var = est2pl$var, names = test, display = FALSE)
# direct equating coefficients between forms 1 and 2 using the Haebara method
l12 <- direc(mods = mod2pl, which = c(1,2), method = "Haebara")
# scoring using direct equating coefficients and the true score equating method
score(l12)
# scoring using direct equating coefficients and the observed score equating method
score(l12, method = "OSE")
# specify only scores from 10 to 15
score(l12, method = "OSE", scores = 10:15)

# all direct equating coefficients using the Haebara method
direclist2pl <- alldirec(mods = mod2pl, method = "Haebara")
# scoring using direct equating coefficients and the true score equating method
score(direclist2pl, link = "test1.test2")

# compute chain equating coefficients for path 1,2,3,4
pth1 <- paste("test", 1:4, sep = "")
chainec1 <- chainec(direclist = direclist2pl, pths = pth1)
# compute chain equating coefficients for path 1,5,4
pth2 <- paste("test", c(1,5,4), sep = "")
chainec2 <- chainec(direclist = direclist2pl, pths = pth2)
# scoring using chain equating coefficients and the true score equating method for score 12
score(chainec1, path = "test1.test2.test3.test4", scores = 12)
score(chainec2, path = "test1.test5.test4", scores = 12)

# create a list of objects of class ceqc
ecall <- c(chainec1, chainec2)
# compute bisector and weighted bisector coefficients
allec <- bisectorec(ecall = ecall, weighted = TRUE, unweighted = TRUE)
# scoring using weighted bisector equating coefficients and the true score 
# equating method for score 12
score(allec, bistype = "weighted", link = "test1.test4", scores = 12)



