library(sensitivitymv)


### Name: senmv
### Title: Sensitivity analysis in observational studies using Huber-Maritz
###   M-statistics.
### Aliases: senmv

### ** Examples


# This example reproduces parts of Table 1 in Rosenbaum (2007).
data(erpcp)
senmv(erpcp,gamma=3,trim=1)
senmv(erpcp,gamma=2,trim=1)
senmv(erpcp,gamma=2,trim=1,tau=0.34)
senmv(erpcp,gamma=2,trim=1,tau=0.18)
senmv(erpcp,gamma=2,trim=1,tau=0.185)

# Example reproduces parts of sect. 4.3 in Rosenbaum (2007)
data(tbmetaphase)
senmv(tbmetaphase,gamma=2,trim=1)
senmv(tbmetaphase,gamma=2,trim=1,tau=0.94)
senmv(tbmetaphase,gamma=2,trim=1,tau=0.945)

# Example reproduces part of Table 1 in Rosenbaum (2013)
data(lead150)
senmv(lead150,gamma=2,trim=2)
data(lead250)
senmv(lead250,gamma=2,trim=2)

# Example reproduces parts of of Rosenbaum (2011).  See documentation for truncatedP.
data(mtm)
senmv(-mtm,gamma=11.7,trim=1)
senmv(-mtm[,2:3],gamma=2.1,trim=1)

# Illustrates method = "i"
data(mercury)
senmv(mercury,gamma=15)
senmv(mercury,gamma=15,method="i")

# Illustrates TonT=TRUE as in method="t".  See note above.
data(mercury)
mean(mercury[,1])-(mean(mercury[,2])+mean(mercury[,3]))/2
senmv(mercury,gamma=15,trim=Inf,TonT=TRUE)$statistic
senmv(mercury,gamma=15,method="t")$statistic
senmv(mercury,gamma=15,method="t",tau=1)$statistic
senmv(mercury,gamma=15,method="t",tau=2)$statistic
senmv(mercury,gamma=15,trim=Inf,TonT=FALSE)$statistic



