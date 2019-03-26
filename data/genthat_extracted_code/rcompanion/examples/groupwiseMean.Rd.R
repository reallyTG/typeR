library(rcompanion)


### Name: groupwiseMean
### Title: Groupwise means and confidence intervals
### Aliases: groupwiseMean

### ** Examples

### Example with formula notation
data(Catbus)
groupwiseMean(Steps ~ Teacher + Sex,
              data        = Catbus,
              traditional = FALSE,
              percentile  = TRUE)

### Example with variable notation
data(Catbus)
groupwiseMean(data        = Catbus,
              var         = "Steps",
              group       = c("Teacher", "Sex"),
              traditional = FALSE,
              percentile  = TRUE)
                                     



