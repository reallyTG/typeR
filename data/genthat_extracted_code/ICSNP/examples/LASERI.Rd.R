library(ICSNP)


### Name: LASERI
### Title: Cardiovascular Responses to Head-up Tilt
### Aliases: LASERI
### Keywords: datasets

### ** Examples

# for example testing if the location before the tilt is the same as 
# 5 minutes after the tilt:
data(LASERI)
DIFFS.T1T4 <- subset(LASERI,select=c(HRT1T4,COT1T4,SVRIT1T4))
rank.ctest(DIFFS.T1T4)
rank.ctest(DIFFS.T1T4, score="s")



