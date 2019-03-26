library(Frames2)


### Name: MLDF
### Title: Multinomial logistic estimator under dual frame approach with
###   auxiliary information from each frame
### Aliases: MLDF

### ** Examples

data(DatMA)
data(DatMB)
data(DatPopM) 

N <- nrow(DatPopM)
levels(DatPopM$Domain) <- c(levels(DatPopM$Domain), "ba")
DatPopMA <- subset(DatPopM, DatPopM$Domain == "a" | DatPopM$Domain == "ab", stringAsFactors = FALSE)
DatPopMB <- subset(DatPopM, DatPopM$Domain == "b" | DatPopM$Domain == "ab", stringAsFactors = FALSE)
DatPopMB[DatPopMB$Domain == "ab",]$Domain <- "ba"

#Let calculate proportions of categories of variable Prog using MLDF estimator
#using Read as auxiliary variable
MLDF(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$Domain, DatMB$Domain, 
DatMA$Read, DatMB$Read, DatPopMA$Read, DatPopMB$Read, DatMA$Id_Frame, DatMB$Id_Frame, 
DatPopMA$Domain, DatPopMB$Domain, N)

#Let obtain 95% confidence intervals together with the estimations
MLDF(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$Domain, DatMB$Domain, 
DatMA$Read, DatMB$Read, DatPopMA$Read, DatPopMB$Read, DatMA$Id_Frame, DatMB$Id_Frame, 
DatPopMA$Domain, DatPopMB$Domain, N, conf_level = 0.95)



