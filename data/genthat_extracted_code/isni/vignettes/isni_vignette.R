## ------------------------------------------------------------------------
library(isni)
data(sos)
sos[sample(nrow(sos),10),]

## ------------------------------------------------------------------------
ymodel= sexact  ~ gender*faculty
summary(glm(ymodel,family=binomial, data=sos))

## ------------------------------------------------------------------------
sos.isni<-isniglm(ymodel, family=binomial, data=sos)
sos.isni

## ------------------------------------------------------------------------
 summary(sos.isni)

## ------------------------------------------------------------------------
ygmodel <- sexact | is.na(sexact)  ~ gender*faculty | gender *faculty
summary(isniglm(ygmodel, family=binomial, data=sos))

## ------------------------------------------------------------------------
 gender <- c(0,0,1,1,0,0,1,1)
 faculty <- c(0,0,0,0,1,1,1,1)
gender <- factor(gender, levels = c(0, 1), labels =c("male", "female"))
faculty <- factor(faculty, levels = c(0, 1), labels =c("other", "mdv"))
 SAcount <- c(NA, 1277, NA, 1247, NA, 126, NA, 152)
 total  <- c(1189,1710,978,1657,68,215,73,246)
sosgrp <- data.frame(gender=gender, faculty=faculty, SAcount=SAcount, total=total)
ymodel <- SAcount/total ~gender*faculty
 sosgrp.isni<-isniglm(ymodel, family=binomial, data=sosgrp, weight=total)
summary(sosgrp.isni)

