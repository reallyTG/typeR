library(MCPAN)


### Name: poly3ci
### Title: Simultaneous confidence intervals for contrasts of
###   poly-3-adjusted tumour rates
### Aliases: poly3ci
### Keywords: htest

### ** Examples


#############################################################

### Methyleugenol example in Schaarschmidt et al. (2008) ####

#############################################################

# load the data:

data(methyl)

# The results in Table 5 (Schaarschmidt et al. 2008) can be
# reproduced by calling:


methylW<-poly3ci(time=methyl$death, status=methyl$tumour,
 f=methyl$group, type = "Williams", method = "ADD1", alternative="greater" )

methylW


methylWT<-poly3test(time=methyl$death, status=methyl$tumour,
 f=methyl$group, type = "Williams", method = "ADD1", alternative="greater" )

methylWT


plot(methylW, main="Simultaneous CI for \n Poly-3-adjusted tumour rates")

# The results in Table 6 can be reproduced by calling:

methylD<-poly3ci(time=methyl$death, status=methyl$tumour,
 f=methyl$group, type = "Dunnett", method = "ADD1", alternative="greater" )

methylD

methylDT<-poly3test(time=methyl$death, status=methyl$tumour,
 f=methyl$group, type = "Dunnett", method = "ADD1", alternative="greater" )

methylDT


plot(methylD, main="Simultaneous CI for Poly-3-adjusted tumour rates", cex.main=0.7)


############################################################


# unadjusted CI

methylD1<-poly3ci(time=methyl$death, status=methyl$tumour,
 f=methyl$group, type = "Dunnett", method = "ADD1", dist="N" )

methylD1

plot(methylD1, main="Local CI for Poly-3-adjusted tumour rates")




