library(Frames2)


### Name: MLSW
### Title: Multinomial logistic estimator under single frame approach with
###   auxiliary information from the whole population
### Aliases: MLSW

### ** Examples

data(DatMA)
data(DatMB)
data(DatPopM) 

IndSample <- c(DatMA$Id_Pop, DatMB$Id_Pop)
#Let calculate proportions of categories of variable Prog using MLSW estimator
#using Read as auxiliary variable
MLSW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$ProbB, DatMB$ProbA,
DatMA$Domain, DatMB$Domain, DatMA$Read, DatMB$Read, DatPopM$Read, IndSample)

#Let obtain 95% confidence intervals together with the estimations
MLSW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$ProbB, DatMB$ProbA,
DatMA$Domain, DatMB$Domain, DatMA$Read, DatMB$Read, DatPopM$Read, IndSample,
conf_level = 0.95)



