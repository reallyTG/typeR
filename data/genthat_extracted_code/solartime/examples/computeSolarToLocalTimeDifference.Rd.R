library(solartime)


### Name: computeSolarToLocalTimeDifference
### Title: computeSolarToLocalTimeDifference
### Aliases: computeSolarToLocalTimeDifference

### ** Examples

# Jena: 50.927222, 11.586111
longDeg <- 11.586
doi <- 1:366
# due to longitude: west of timezone meridian: sun culminates later,
# solar time is less than local time
(localDiff <- computeSolarToLocalTimeDifference(longDeg, 1L)*60)
# taking into account shift during the year due to earth orbit eccentricity
plot( computeSolarToLocalTimeDifference(longDeg, 1L, doi)*60 ~ doi )
abline(h = localDiff)



