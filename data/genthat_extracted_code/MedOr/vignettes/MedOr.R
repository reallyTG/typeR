### R code from vignette source 'MedOr.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: medorinst (eval = FALSE)
###################################################
## install.packages("MedOr_VERSION.tar.gz",
##                  repos=NULL,type="source")


###################################################
### code chunk number 2: <medor
###################################################
library("MedOr")


###################################################
### code chunk number 3: MedOr.Rnw:101-103
###################################################
options(width=60)
set.seed(1234)


###################################################
### code chunk number 4: example1
###################################################
x <- rnorm(20,0,1)
conf.interval(x,alpha=0.95)


###################################################
### code chunk number 5: example2
###################################################
data(gleason7)
d <- list(x1 = gleason7[1:5,1], x2 = gleason7[,2])
conf.statement(d)


