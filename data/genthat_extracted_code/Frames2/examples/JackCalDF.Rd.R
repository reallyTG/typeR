library(Frames2)


### Name: JackCalDF
### Title: Confidence intervals for dual frame calibration estimator based
###   on jackknife method
### Aliases: JackCalDF

### ** Examples

data(DatA)
data(DatB)

#Let obtain a 95% jackknife confidence interval for variable Clothing,
#with frame sizes and overlap domain size known, supposing a stratified
#sampling in frame A and a simple random sampling without replacement 
#in frame B with no finite population correction factor in any frame.
JackCalDF(DatA$Clo, DatB$Clo, DatA$ProbA, DatB$ProbB, 
DatA$Domain, DatB$Domain, N_A = 1735, N_B = 1191, N_ab = 601, conf_level = 0.95,
sdA = "str", sdB = "srs", strA = DatA$Stratum)

#Finally, let consider a finite population correction factor in both frames.
JackCalDF(DatA$Clo, DatB$Clo, DatA$ProbA, DatB$ProbB, 
DatA$Domain, DatB$Domain, N_A = 1735, N_B = 1191, N_ab = 601, conf_level = 0.95,
sdA = "str", sdB = "srs", strA = DatA$Stratum, fcpA = TRUE, fcpB = TRUE)



