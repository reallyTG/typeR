library(intubate)


### Name: gplots
### Title: Interfaces for gplots package for data science pipelines.
### Aliases: ntbt_bandplot ntbt_lowess ntbt_overplot ntbt_plotmeans
### Keywords: intubate magrittr gplots bandplot lowess overplot plotmeans

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(gplots)
##D 
##D 
##D ## ntbt_bandplot: Plot x-y Points with Locally Smoothed Mean and Standard Deviation
##D x <- 1:1000
##D y <- rnorm(1000, mean=1, sd=1 + x/1000 )
##D dta <- data.frame(x, y)
##D rm(x, y)
##D 
##D ## Original function to interface
##D bandplot(y ~ x, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_bandplot(dta, y ~ x)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_bandplot(y ~ x)
##D 
##D 
##D ## ntbt_lowess: Scatter Plot Smoothing
##D ## Original function to interface
##D lowess(dist ~ speed, data = cars)
##D 
##D ## The interface puts data as first parameter
##D ntbt_lowess(cars, dist ~ speed)
##D 
##D ## so it can be used easily in a pipeline.
##D cars %>%
##D   ntbt_lowess(dist ~ speed)
##D 
##D cars %>%
##D   ntbt_plot(dist ~ speed, main="lowess(cars)") %>%
##D   ntbt_lowess(dist ~ speed) %>%
##D   lines(col=2, lty=2)
##D 
##D 
##D ## ntbt_overplot: Plot multiple variables on the same region,
##D ##                with appropriate axes
##D data(rtPCR)
##D 
##D ## Original function to interface
##D overplot(RQ ~ Conc..ug.ml. | Test.Substance,
##D          data = rtPCR,
##D          subset = Detector == "ProbeType 1" & Conc..ug.ml. > 0,
##D          same.scale = TRUE,
##D          log="xy",
##D          f=3/4,
##D          main="Detector=ProbeType 1",
##D          xlab="Concentration (ug/ml)",
##D          ylab="Relative Gene Quantification"
##D )## Original function to interface
##D 
##D ## The interface puts data as first parameter
##D ntbt_overplot(rtPCR,
##D               RQ ~ Conc..ug.ml. | Test.Substance,
##D               subset = Detector == "ProbeType 1" & Conc..ug.ml. > 0,
##D               same.scale = TRUE,
##D               log="xy",
##D               f=3/4,
##D               main="Detector=ProbeType 1",
##D               xlab="Concentration (ug/ml)",
##D               ylab="Relative Gene Quantification"
##D )## Original function to interface
##D 
##D ## so it can be used easily in a pipeline.
##D rtPCR %>%
##D   ntbt_overplot(RQ ~ Conc..ug.ml. | Test.Substance,
##D                 subset = Detector == "ProbeType 1" & Conc..ug.ml. > 0,
##D                 same.scale = TRUE,
##D                 log="xy",
##D                 f=3/4,
##D                 main="Detector=ProbeType 1",
##D                 xlab="Concentration (ug/ml)",
##D                 ylab="Relative Gene Quantification"
##D   )## Original function to interface
##D 
##D 
##D ## ntbt_plotmeans: Plot Group Means and Confidence Intervals
##D data(state)
##D dta <- data.frame(state.abb, state.region)
##D 
##D ## Original function to interface
##D plotmeans(state.area ~ state.region, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_plotmeans(dta, state.area ~ state.region)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_plotmeans(state.area ~ state.region)
## End(Not run)



