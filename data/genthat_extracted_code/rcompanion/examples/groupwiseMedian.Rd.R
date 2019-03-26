library(rcompanion)


### Name: groupwiseMedian
### Title: Groupwise medians and confidence intervals
### Aliases: groupwiseMedian

### ** Examples

### Example with formula notation
data(Catbus)
groupwiseMedian(Steps ~ Teacher + Sex,
                data        = Catbus,
                bca         = FALSE,
                percentile  = TRUE,
                R           = 1000)
                
### Example with variable notation
data(Catbus)
groupwiseMedian(data         = Catbus,
                var         = "Steps",
                group       = c("Teacher", "Sex"),
                bca         = FALSE,
                percentile  = TRUE,
                R           = 1000)
                      



