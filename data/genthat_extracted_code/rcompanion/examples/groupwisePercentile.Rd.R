library(rcompanion)


### Name: groupwisePercentile
### Title: Groupwise percentiles and confidence intervals
### Aliases: groupwisePercentile

### ** Examples

### Example with formula notation
data(Catbus)
groupwisePercentile(Steps ~ Teacher + Sex,
                    data        = Catbus,
                    tau         = 0.25,
                    bca         = FALSE,
                    percentile  = TRUE,
                    R           = 1000)
                
### Example with variable notation
data(Catbus)
groupwisePercentile(data         = Catbus,
                    var         = "Steps",
                    group       = c("Teacher", "Sex"),
                    tau         = 0.25,
                    bca         = FALSE,
                    percentile  = TRUE,
                    R           = 1000)
                      



