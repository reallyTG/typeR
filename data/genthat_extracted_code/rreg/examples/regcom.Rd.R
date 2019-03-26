library(rreg)


### Name: regcom
### Title: Barplot with point and table for comparison
### Aliases: regcom

### ** Examples

library("rreg")
regcom(data = hfdata, x = inst, yl = case2, yc = case1)

# include table
regcom(data = hfdata, x = inst, yl = case2, yc = case1, tab = FALSE)

# keep original order
regcom(data = hfdata, x = inst, yl = case2, yc = case1, scale = "Percentage", ascending = FALSE)

# text for table rotate 10%
regcom(data = hfdata, x = inst, yl = case2, yc = case1, lab1="Tawau", lab2="Negara", rotate=10)




