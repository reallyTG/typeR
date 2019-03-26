library(Frames2)


### Name: MLCSW
### Title: Multinomial logistic calibration estimator under single frame
###   approach with auxiliary information from the whole population
### Aliases: MLCSW

### ** Examples

data(DatMA)
data(DatMB)
data(DatPopM) 

IndSample <- c(DatMA$Id_Pop, DatMB$Id_Pop)
N_FrameA <- nrow(DatPopM[DatPopM$Domain == "a" | DatPopM$Domain == "ab",])
N_FrameB <- nrow(DatPopM[DatPopM$Domain == "b" | DatPopM$Domain == "ab",])
N_Domainab <- nrow(DatPopM[DatPopM$Domain == "ab",])
#Let calculate proportions of categories of variable Prog using MLCSW estimator
#using Read as auxiliary variable
MLCSW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$ProbB, DatMB$ProbA,
DatMA$Domain, DatMB$Domain, DatMA$Read, DatMB$Read, DatPopM$Read, IndSample, N_FrameA, 
N_FrameB)

#Now, let suppose that the overlap domian size is known
MLCSW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$ProbB, DatMB$ProbA,
DatMA$Domain, DatMB$Domain, DatMA$Read, DatMB$Read, DatPopM$Read, IndSample, N_FrameA, 
N_FrameB, N_Domainab)

#Let obtain 95% confidence intervals together with the estimations
MLCSW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$ProbB, DatMB$ProbA,
DatMA$Domain, DatMB$Domain, DatMA$Read, DatMB$Read, DatPopM$Read, IndSample, N_FrameA, 
N_FrameB, N_Domainab, conf_level = 0.95)



