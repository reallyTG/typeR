library(Frames2)


### Name: MLCDW
### Title: Multinomial logistic calibration estimator under dual frame
###   approach with auxiliary information from the whole population
### Aliases: MLCDW

### ** Examples

data(DatMA)
data(DatMB)
data(DatPopM) 

IndSample <- c(DatMA$Id_Pop, DatMB$Id_Pop)
N_FrameA <- nrow(DatPopM[DatPopM$Domain == "a" | DatPopM$Domain == "ab",])
N_FrameB <- nrow(DatPopM[DatPopM$Domain == "b" | DatPopM$Domain == "ab",])
N_Domainab <- nrow(DatPopM[DatPopM$Domain == "ab",])
#Let calculate proportions of categories of variable Prog using MLCDW estimator
#using Read as auxiliary variable
MLCDW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$Domain, DatMB$Domain, 
DatMA$Read, DatMB$Read, DatPopM$Read, IndSample, N_FrameA, N_FrameB)

#Now, let suppose that the overlap domian size is known
MLCDW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$Domain, DatMB$Domain, 
DatMA$Read, DatMB$Read, DatPopM$Read, IndSample, N_FrameA, N_FrameB, N_Domainab)

#Let obtain 95% confidence intervals together with the estimations
MLCDW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$Domain, DatMB$Domain, 
DatMA$Read, DatMB$Read, DatPopM$Read, IndSample, N_FrameA, N_FrameB, N_Domainab,
conf_level = 0.95)



