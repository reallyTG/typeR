library(Frames2)


### Name: JackHartley
### Title: Confidence intervals for Hartley estimator based on jackknife
###   method
### Aliases: JackHartley

### ** Examples

data(DatA)
data(DatB)

#Let obtain a 95% jackknife confidence interval for variable Feeding,
#supposing a stratified sampling in frame A and a simple random sampling
#without replacement in frame B with no finite population correction
#factor in any frame.
JackHartley(DatA$Feed, DatB$Feed, DatA$ProbA, DatB$ProbB, DatA$Domain,
DatB$Domain, 0.95, "str", "srs", strA = DatA$Stratum)

#Let check how interval estimation varies when a finite 
#population correction factor is considered in both frames.
JackHartley(DatA$Feed, DatB$Feed, DatA$ProbA, DatB$ProbB, DatA$Domain,
DatB$Domain, 0.95, "str", "srs", strA = DatA$Stratum, fcpA = TRUE,
fcpB = TRUE)



