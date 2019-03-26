library(Frames2)


### Name: JackSFRR
### Title: Confidence intervals for raking ratio estimator based on
###   jackknife method
### Aliases: JackSFRR

### ** Examples

data(DatA)
data(DatB) 

#Let obtain a 95% jackknife confidence interval for variable Leisure,
#supposing a stratified sampling in frame A and a simple random sampling
#without replacement in frame B with no finite population correction 
#factor in any frame.
JackSFRR(DatA$Lei, DatB$Lei, DatA$ProbA, DatB$ProbB, DatA$ProbB, 
DatB$ProbA, DatA$Domain, DatB$Domain, 1735, 1191, 0.95, "str", "srs",
strA = DatA$Stratum)

#Let check how interval estimation varies when a finite 
#population correction factor is considered in both frames.
JackSFRR(DatA$Lei, DatB$Lei, DatA$ProbA, DatB$ProbB, DatA$ProbB, 
DatB$ProbA, DatA$Domain, DatB$Domain, 1735, 1191, 0.95, "str", "srs", 
strA = DatA$Stratum, fcpA = TRUE, fcpB = TRUE)



