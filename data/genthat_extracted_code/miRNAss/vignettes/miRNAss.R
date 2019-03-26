### R code from vignette source 'miRNAss.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: loadPackages
###################################################
library('miRNAss')


###################################################
### code chunk number 2: loadPackages (eval = FALSE)
###################################################
## miRNAss(features, labels)


###################################################
### code chunk number 3: setY
###################################################
y = as.numeric(celegans$CLASS)*2 - 1


###################################################
### code chunk number 4: sampleY
###################################################
y[sample(which(y > 0),200)] = 0
y[sample(which(y < 0),700)] = 0


###################################################
### code chunk number 5: removeLabels
###################################################
x = subset(celegans, select = -CLASS)


###################################################
### code chunk number 6: miRNAssCall
###################################################
p = miRNAss(x,y)


###################################################
### code chunk number 7: predictions
###################################################
is.miRNA = which(p > 0)


###################################################
### code chunk number 8: performance
###################################################
SE = mean(p[ celegans$CLASS & y == 0] > 0)
SP = mean(p[!celegans$CLASS & y == 0] < 0)
cat('Sensitivity: ', SE, '\nSpecificity: ', SP, '\n')


###################################################
### code chunk number 9: loadPackages
###################################################
help(miRNAss)


###################################################
### code chunk number 10: loadPackages (eval = FALSE)
###################################################
## setwd('miRNAss-experiments')
## source('2-delta_mirBase.R')


###################################################
### code chunk number 11: loadPackages (eval = FALSE)
###################################################
## source('plotResults.R')


###################################################
### code chunk number 12: sessionInfo
###################################################
toLatex(sessionInfo())


