library(idem)


### Name: imData
### Title: Create data for IDEM analysis
### Aliases: imData

### ** Examples

rst.data <- imData(abc, trt="TRT", surv="SURV", outcome=c("Y1","Y2"),
                   y0=NULL, endfml="Y2",
                   trt.label = c("UC+SBT", "SAT+SBT"),
                   cov=c("AGE"), duration=365, bounds=c(0,100));




