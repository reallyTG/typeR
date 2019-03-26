library(Frames2)


### Name: JackMLCDW
### Title: Confidence intervals for MLCDW estimator based on jackknife
###   method
### Aliases: JackMLCDW

### ** Examples

data(DatMA)
data(DatMB)
data(DatPopM)

IndSample <- c(DatMA$Id_Pop, DatMB$Id_Pop)
N_FrameA <- nrow(DatPopM[DatPopM$Domain == "a" | DatPopM$Domain == "ab",])
N_FrameB <- nrow(DatPopM[DatPopM$Domain == "b" | DatPopM$Domain == "ab",])

## No test: 
#Let obtain a 95% jackknife confidence interval for variable Feeding,
#supposing a pps sampling in frame A and a simple random sampling
#without replacement in frame B with no finite population correction
#factor in any frame.
JackMLCDW(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$Domain, 
DatMB$Domain, DatMA$Read, DatMB$Read, DatPopM$Read, IndSample, N_FrameA, 
N_FrameB, conf_level = 0.95, sdA = "pps", sdB = "srs")
## End(No test)



