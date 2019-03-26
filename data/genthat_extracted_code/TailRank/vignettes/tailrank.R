### R code from vignette source 'tailrank.Rnw'

###################################################
### code chunk number 1: lib
###################################################
library(TailRank)


###################################################
### code chunk number 2: data
###################################################
library(oompaData)
data(expression.data)
data(gene.info)
data(clinical.info)
dim(clinical.info)


###################################################
### code chunk number 3: summary
###################################################
clinical.info$Status <- ordered(clinical.info$Status, 
                                levels=c("N", "T", "L"))
summary(clinical.info)


###################################################
### code chunk number 4: trt
###################################################
trt <- TailRankTest(expression.data, clinical.info$Status) #$
summary(trt)


###################################################
### code chunk number 5: trt2
###################################################
trt2 <- TailRankTest(expression.data, clinical.info$Status, 
                    specificity=0.99, confidence=0.99) #$
summary(trt2)


###################################################
### code chunk number 6: sel
###################################################
sel <- as.logical(trt)
sel2 <- as.logical(trt2)
sum(sel2 & sel)


###################################################
### code chunk number 7: gi
###################################################
gene.info[sel2, 3:6]


###################################################
### code chunk number 8: trp
###################################################
tailRankPower(2000, N1=41, N2=71, psi=0.95, phi=0.40, conf=0.95)


###################################################
### code chunk number 9: trp2
###################################################
tailRankPower(40000, N1=41, N2=71, psi=0.95, phi=0.40, conf=0.95)


###################################################
### code chunk number 10: trp3
###################################################
tailRankPower(40000, N1=41, N2=seq(40,100,by=10), 
              psi=0.95, phi=0.40, conf=0.95)


###################################################
### code chunk number 11: bmpt
###################################################
biomarkerPowerTable(G=c(10000, 20000, 40000), N1=41, 
                    N2=seq(40, 100, by=10), conf=0.95, 
                    psi=0.95, phi=seq(0.30, 0.50, by=0.05))


