library(metafor)


### Name: escalc
### Title: Calculate Effect Sizes and Outcome Measures
### Aliases: escalc escalc.default escalc.formula [.escalc [.summary.escalc
###   cbind.escalc cbind.summary.escalc rbind.escalc rbind.summary.escalc
### Keywords: datagen

### ** Examples

### load BCG vaccine data
dat <- get(data(dat.bcg))

### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat)
dat

### suppose that for a particular study, yi and vi are known (i.e., have
### already been calculated) but the 2x2 table counts are not known; with
### replace=FALSE, the yi and vi values for that study are not replaced
dat[1:12,10:11] <- NA
dat[13,4:7] <- NA
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat, replace=FALSE)
dat

### using formula interface (first rearrange data into long format)
dat.long <- to.long(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
                    data=dat, append=FALSE, vlong=TRUE)
escalc(measure="RR", outcome ~ group | study, weights=freq, data=dat.long)

### convert a regular data frame to an 'escalc' object
### dataset from Lipsey & Wilson (2001), Table 7.1, page 130
dat <- data.frame(id = c(100, 308, 1596, 2479, 9021, 9028, 161, 172, 537, 7049),
                  yi = c(-0.33, 0.32, 0.39, 0.31, 0.17, 0.64, -0.33, 0.15, -0.02, 0.00),
                  vi = c(0.084, 0.035, 0.017, 0.034, 0.072, 0.117, 0.102, 0.093, 0.012, 0.067),
                  random = c(0, 0, 0, 0, 0, 0, 1, 1, 1, 1),
                  intensity = c(7, 3, 7, 5, 7, 7, 4, 4, 5, 6))
dat <- escalc(measure="SMD", yi=yi, vi=vi, data=dat, slab=paste("Study ID:", id), digits=3)
dat



