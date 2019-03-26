library(isni)


### Name: isniglm
### Title: Function for ISNI computation when the outcome follows GLMs.
### Aliases: isniglm

### ** Examples

## load data set
data(sos)

## Perform the MAR analysis
ymodel= sexact  ~ gender*faculty
summary(glm(ymodel,family=binomial, data=sos))

## Perform ISNI analysis
sos.isni<-isniglm(ymodel, family=binomial, data=sos)
sos.isni
summary(sos.isni)

## specifying the missing data model explicitly
ygmodel= sexact | is.na(sexact)  ~ gender*faculty | gender *faculty
summary(isniglm(ygmodel, family=binomial, data=sos))
 

 ## ISNI for grouped binomial regression. 
gender <- c(0,0,1,1,0,0,1,1)
faculty    <- c(0,0,0,0,1,1,1,1)
gender = factor(gender, levels = c(0, 1), labels =c("male", "female"))
faculty = factor(faculty, levels = c(0, 1), labels =c("other", "mdv"))
 
SAcount <- c(NA, 1277, NA, 1247, NA, 126, NA, 152)
total       <- c(1189,1710,978,1657,68,215,73,246)
sosgrp <- data.frame(gender=gender, faculty=faculty, SAcount=SAcount, total=total)
ymodel <- SAcount/total ~gender*faculty
sosgrp.isni<-isniglm(ymodel, family=binomial, data=sosgrp, weight=total)



