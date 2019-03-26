### R code from vignette source 'pl_open_positions.Rnw'

###################################################
### code chunk number 1: pl_open_positions.Rnw:25-28
###################################################
options(continue = "  ", digits = 3, width = 60, useFancyQuotes = FALSE)
pv <- packageVersion("PMwR")
pv <- gsub("(.*)[.](.*)", "\\1-\\2", pv)


###################################################
### code chunk number 2: pl_open_positions.Rnw:79-80
###################################################
library("PMwR")


###################################################
### code chunk number 3: pl_open_positions.Rnw:86-89
###################################################
j <- journal(amount = 1, price = 20)
pl(j)
pl(j, vprice = 21)


###################################################
### code chunk number 4: pl_open_positions.Rnw:92-96
###################################################
j <- journal(amount = c(1, -1), 
             price = c(102, 109),
             timestamp = c(2.5, 9))
pl(j, vprice = 101:110, along.timestamp = 1:10)


###################################################
### code chunk number 5: pl_open_positions.Rnw:101-113
###################################################
j <- journal(amount = c(1, -1, 1), 
             instrument = c("A", "A", "B"),
             timestamp = c(1, 2, 1),
             price = c(100, 103, 10))

P <- cbind(A = c(100, 102, 105),
           B = c( 10,   5,  11))
      
pl(j, vprice = P, 
   along.timestamp = 1:3)
pl(j, vprice = P, 
   along.timestamp = 1:3, do.sum = TRUE)


