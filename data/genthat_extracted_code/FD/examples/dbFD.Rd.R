library(FD)


### Name: dbFD
### Title: Distance-Based Functional Diversity Indices
### Aliases: dbFD
### Keywords: multivariate

### ** Examples

# mixed trait types, NA's
ex1 <- dbFD(dummy$trait, dummy$abun)
ex1

# add variable weights
# 'cailliez' correction is used because 'sqrt' does not work
w<-c(1, 5, 3, 2, 5, 2, 6, 1)
ex2 <- dbFD(dummy$trait, dummy$abun, w, corr="cailliez")

# if 'x' is a distance matrix
trait.d <- gowdis(dummy$trait)
ex3 <- dbFD(trait.d, dummy$abun)
ex3

# one numeric trait, one NA
num1 <- dummy$trait[,1] ; names(num1) <- rownames(dummy$trait)
ex4 <- dbFD(num1, dummy$abun)
ex4

# one ordered trait, one NA
ord1 <- dummy$trait[,5] ; names(ord1) <- rownames(dummy$trait)
ex5 <- dbFD(ord1, dummy$abun)
ex5

# one nominal trait, one NA
fac1 <- dummy$trait[,3] ; names(fac1) <- rownames(dummy$trait)
ex6 <- dbFD(fac1, dummy$abun)
ex6

# example with real data from New Zealand short-tussock grasslands
# 'lingoes' correction used because 'sqrt' does not work in that case
ex7 <- dbFD(tussock$trait, tussock$abun, corr = "lingoes")


## Not run: 
##D # calc.FGR = T, 'ward'
##D ex7 <- dbFD(dummy$trait, dummy$abun, calc.FGR = T)
##D ex7
##D 
##D # calc.FGR = T, 'kmeans'
##D ex8 <- dbFD(dummy$trait, dummy$abun, calc.FGR = T,
##D clust.type = "kmeans")
##D ex8
##D 
##D # ward clustering to compute FGR
##D ex9 <- dbFD(tussock$trait, tussock$abun,
##D corr = "cailliez", calc.FGR = TRUE, clust.type = "ward")
##D # choose 'g' for number of groups
##D # 6 groups seems to make good ecological sense
##D ex9
##D 
##D # however, calinksi criterion in 'kmeans' suggests
##D # that 6 groups may not be optimal
##D ex10 <- dbFD(tussock$trait, tussock$abun, corr = "cailliez",
##D calc.FGR = TRUE, clust.type = "kmeans", km.sup.gr = 10)
## End(Not run)



