library(Frames2)


### Name: JackMLDW
### Title: Confidence intervals for MLDW estimator based on jackknife
###   method
### Aliases: JackMLDW

### ** Examples

data(DatMA)
data(DatMB)
data(DatPopM)

IndSample <- c(DatMA$Id_Pop, DatMB$Id_Pop)

## No test: 
#Let obtain a 95% jackknife confidence interval for variable Feeding,
#supposing a pps sampling in frame A and a simple random sampling
#without replacement in frame B with no finite population correction
#factor in any frame.
JackMLDW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$Domain, 
DatMB$Domain, DatMA$Read, DatMB$Read, DatPopM$Read, IndSample, 0.95, 
"pps", "srs")
## End(No test)



