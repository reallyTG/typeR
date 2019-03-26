library(Frames2)


### Name: JackFB
### Title: Confidence intervals for Fuller-Burmeister estimator based on
###   jackknife method
### Aliases: JackFB

### ** Examples

data(DatA)
data(DatB)

#Let obtain a 95% jackknife confidence interval for variable Clothing,
#supposing a stratified sampling in frame A and a simple random sampling
#without replacement in frame B with no finite population correction factor
#in any frame.
JackFB(DatA$Clo, DatB$Clo, DatA$ProbA, DatB$ProbB, DatA$Domain, 
DatB$Domain, 0.95, "str", "srs", strA = DatA$Stratum)

#Let check how interval estimation varies when a finite
#population correction factor is considered in both frames.
JackFB(DatA$Clo, DatB$Clo, DatA$ProbA, DatB$ProbB, DatA$Domain,
DatB$Domain, 0.95, "str", "srs", strA = DatA$Stratum,
fcpA = TRUE, fcpB = TRUE)



