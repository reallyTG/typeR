library(rreg)


### Name: regbar
### Title: Barplot with explicit data comparison
### Aliases: regbar

### ** Examples

# basic usage
library("rreg")
regbar(data = hfdata, x = inst, y = case2)
regbar(hfdata, inst, case2, comp = "Tawau HF")
regbar(hfdata, inst, 2007, comp = "Taw", num = extt)

# split text visualisatio at 5% of max value
regbar(hfdata, inst, 2007, comp = "Taw", split = 0.05)




