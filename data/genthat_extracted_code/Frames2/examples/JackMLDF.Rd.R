library(Frames2)


### Name: JackMLDF
### Title: Confidence intervals for MLDF estimator based on jackknife
###   method
### Aliases: JackMLDF

### ** Examples

data(DatMA)
data(DatMB)
data(DatPopM)

N <- nrow(DatPopM)
levels(DatPopM$Domain) <- c(levels(DatPopM$Domain), "ba")
DatPopMA <- subset(DatPopM, DatPopM$Domain == "a" | DatPopM$Domain == "ab", stringAsFactors = FALSE)
DatPopMB <- subset(DatPopM, DatPopM$Domain == "b" | DatPopM$Domain == "ab", stringAsFactors = FALSE)
DatPopMB[DatPopMB$Domain == "ab",]$Domain <- "ba"

## No test: 
#Let obtain a 95% jackknife confidence interval for variable Feeding,
#supposing a pps sampling in frame A and a simple random sampling
#without replacement in frame B with no finite population correction
#factor in any frame.
JackMLDF(DatMA$Prog, DatMB$Prog, DatMA$ProbA, DatMB$ProbB, DatMA$Domain, 
DatMB$Domain, DatMA$Read, DatMB$Read, DatPopMA$Read, DatPopMB$Read, 
DatMA$Id_Frame, DatMB$Id_Frame, DatPopMA$Domain, DatPopMB$Domain, N, 0.95, 
"pps", "srs")
## End(No test)



