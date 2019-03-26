library(MCPAN)


### Name: MCPAN-package
### Title: Multiple comparison procedures based on normal approximation and
###   extensions.
### Aliases: MCPAN-package MCPAN
### Keywords: package

### ** Examples



# # # 1)
# Simultaneous confidence intervals 
# for 2xk tables of binomial data: 
# binomRDtest, binomRDci

# Difference of proportions

binomRDci(x=c(2,6,4,13), n=c(34,33,36,34),
 names=c("Placebo", "50", "75", "150"),
 type="Dunnett", method="ADD1")

# Odds ratios:

binomORci(x=c(2,6,4,13), n=c(34,33,36,34),
 names=c("Placebo", "50", "75", "150"),
 type="Dunnett")


# # # 
# Simultaneous confidence intervals for comparing a treatment
# (trt) to 3 controls (Var1-Var3) in terms of differences of
# Simpson indices for a community comprising 33 species.

PSM <-
as.data.frame(structure(c(0, 0, 2, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 
2, 1, 1, 1, 0, 1, 2, 50, 25, 29, 42, 1, 1, 0, 3, 14, 6, 6, 24, 
64, 56, 121, 98, 1, 1, 1, 4, 410, 357, 586, 588, 16, 29, 21, 
38, 1, 1, 1, 1, 7, 12, 7, 11, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 4, 
1, 4, 3, 11, 4, 0, 0, 1, 0, 0, 1, 5, 0, 0, 0, 1, 1, 0, 0, 1, 
0, 30, 31, 10, 42, 0, 0, 1, 0, 7, 8, 10, 13, 111, 125, 112, 73, 
2, 1, 0, 0, 67, 64, 81, 102, 0, 0, 1, 0, 0, 0, 0, 1, 21, 20, 
14, 24, 0, 1, 0, 0), .Dim = c(4L, 33L), .Dimnames = list(c("Trt", 
"Var1", "Var2", "Var3"), c("Sp1", "Sp2", "Sp3", "Sp4", "Sp5", "Sp6", 
"Sp7", "Sp8", "Sp9", "Sp10", "Sp11", "Sp12", "Sp13", "Sp14", 
"Sp15", "Sp16", "Sp17", "Sp18", "Sp19", "Sp20", "Sp21", "Sp22", 
"Sp23", "Sp24", "Sp25", "Sp26", "Sp27", "Sp28", "Sp29", "Sp30", 
"Sp31", "Sp32", "Sp33"))))

fvar<-factor(row.names(PSM), levels=row.names(PSM))

Simpsonci(X=PSM, f=fvar)

# The complete data is available in package simboot.

# # #
# Simultaneous confidence intervals for ratios of expected values
# under lognormal assumption

x <- rlnorm(n=40, meanlog=rep(c(0,0.1,1,1), each=10), sdlog=rep(c(0.2,0.2,0.5,0.5), each=10))
f <- as.factor(rep(LETTERS[1:4], each=10))

lnrci(x=x, f=f, type="Tukey", method="GPQ", B=10000)





