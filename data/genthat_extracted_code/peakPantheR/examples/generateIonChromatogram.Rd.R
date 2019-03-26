library(peakPantheR)


### Name: generateIonChromatogram
### Title: Generate ion chromatogram from raw data points
### Aliases: generateIonChromatogram

### ** Examples

## Not run: 
##D ## Input data points
##D in_rt   <- c(3362.102, 3362.102, 3363.667, 3363.667, 3365.232, 3365.232, 3366.797, 3366.797,
##D              3368.362, 3368.362)
##D in_mz   <- c(496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2, 496.2, 497.2)
##D in_int  <- c(39616, 11432, 63344, 18224, 107352, 30936, 182144, 51776, 295232, 81216)
##D input_ROIDataPoints <- data.frame(rt=in_rt, mz=in_mz, int=in_int)
##D 
##D ## Aggregate mz to generate EIC
##D EIC <- generateIonChromatogram(input_ROIDataPoints, aggregationFunction='sum')
##D EIC
##D #         rt    int
##D # 1 3362.102  51048
##D # 2 3363.667  81568
##D # 3 3365.232 138288
##D # 4 3366.797 233920
##D # 5 3368.362 376448
## End(Not run)



