library(pubh)


### Name: estat
### Title: Descriptive statistics for continuous variables.
### Aliases: estat

### ** Examples

data(kfm, package = "ISwR")
estat(~ dl.milk, data = kfm, label = "Breast-milk intake (dl/day)")
estat(~ dl.milk|sex, data = kfm, label = "Breast-milk intake (dl/day)")
estat(~ weight|sex, data = kfm, label = "Weight of child (kg)")



