### R code from vignette source 'DAKS.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
library("DAKS")
library("relations")
library("sets")
options(prompt="R> ", continue="R+", width=70)


###################################################
### code chunk number 2: integer
###################################################
1 == 1L


###################################################
### code chunk number 3: pisa1
###################################################
head(pisa)
pat <- pattern(pisa)
pat
sum(pat$response.patterns)


###################################################
### code chunk number 4: pisa2
###################################################
apply(pisa, 2, table)


###################################################
### code chunk number 5: iita
###################################################
mini <- iita(pisa, v = 1)
corr <- iita(pisa, v = 2)
orig <- iita(pisa, v = 3)
summary(mini)
summary(corr)
summary(orig)


###################################################
### code chunk number 6: set-operations1
###################################################
set_symdiff(orig$implications, mini$implications)


###################################################
### code chunk number 7: set-operations2
###################################################
set_is_proper_subset(orig$implications, mini$implications)


