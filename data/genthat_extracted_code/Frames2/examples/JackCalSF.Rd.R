library(Frames2)


### Name: JackCalSF
### Title: Confidence intervals for SF calibration estimator based on
###   jackknife method
### Aliases: JackCalSF

### ** Examples

data(DatA)
data(DatB)

#Let obtain a 95% jackknife confidence interval for variable Clothing,
#with frame sizes and overlap domain size known, supposing a stratified
#sampling in frame A and a simple random sampling without replacement 
#in frame B with no finite population correction factor in any frame
JackCalSF(DatA$Clo, DatB$Clo, DatA$ProbA, DatB$ProbB, 
DatA$ProbB, DatB$ProbA, DatA$Domain, DatB$Domain, N_A = 1735, 
N_B = 1191, N_ab = 601, conf_level = 0.95, sdA = "str", sdB = "srs",
strA = DatA$Stratum)



