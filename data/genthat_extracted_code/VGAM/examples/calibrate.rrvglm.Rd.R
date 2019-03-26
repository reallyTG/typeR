library(VGAM)


### Name: calibrate.rrvglm
### Title: Calibration for CLO models (RR-VGLMs)
### Aliases: calibrate.rrvglm
### Keywords: models regression

### ** Examples

## Not run: 
##D   # Example 1
##D nona.xs.nz <- na.omit(xs.nz)  # Overkill!! (Data in VGAMdata package)
##D nona.xs.nz$dmd     <- with(nona.xs.nz, round(drinkmaxday))
##D nona.xs.nz$feethr  <- with(nona.xs.nz, round(feethour))
##D nona.xs.nz$sleephr <- with(nona.xs.nz, round(sleep))
##D nona.xs.nz$beats   <- with(nona.xs.nz, round(pulse))
##D 
##D p2 <- rrvglm(cbind(dmd, feethr, sleephr, beats) ~ age + smokenow +
##D   depressed + embarrassed + fedup + hurt + miserable +  # 11 psychological
##D   nofriend + moody + nervous + tense + worry + worrier, # variables
##D   noRRR = ~ age + smokenow, trace = FALSE, poissonff, data = nona.xs.nz,
##D   Rank = 2)
##D cp2 <- calibrate(p2, newdata = head(nona.xs.nz, 9), trace = TRUE)
##D cp2
##D 
##D two.cases <- nona.xs.nz[1:2, ]  # Another calibration example
##D two.cases$dmd       <- c(4, 10)
##D two.cases$feethr    <- c(4, 7)
##D two.cases$sleephr   <- c(7, 8)
##D two.cases$beats     <- c(62, 71)
##D (cp2b <- calibrate(p2, newdata = two.cases))
##D 
##D # Example 2
##D p1 <- rrvglm(cbind(dmd, feethr, sleephr, beats) ~ age + smokenow +
##D   depressed + embarrassed + fedup + hurt + miserable +  # 11 psychological
##D   nofriend + moody + nervous + tense + worry + worrier, # variables
##D   noRRR = ~ age + smokenow, trace = FALSE, poissonff, data = nona.xs.nz,
##D   Rank = 1)
##D (cp1c <- calibrate(p1, newdata = two.cases, lr.confint = TRUE))
## End(Not run)



