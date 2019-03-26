library(Frames2)


### Name: MLDW
### Title: Multinomial logistic estimator under dual frame approach with
###   auxiliary information from the whole population
### Aliases: MLDW

### ** Examples

data(DatMA)
data(DatMB)
data(DatPopM) 

IndSample <- c(DatMA$Id_Pop, DatMB$Id_Pop)
#Let calculate proportions of categories of variable Prog using MLDW estimator
#using Read as auxiliary variable
MLDW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$Domain, DatMB$Domain, 
DatMA$Read, DatMB$Read, DatPopM$Read, IndSample)

#Let obtain 95% confidence intervals together with the estimations
MLDW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$Domain, DatMB$Domain, 
DatMA$Read, DatMB$Read, DatPopM$Read, IndSample, 0.95)



