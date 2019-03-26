library(ggpubr)


### Name: desc_statby
### Title: Descriptive statistics by groups
### Aliases: desc_statby

### ** Examples

# Load data
data("ToothGrowth")

# Descriptive statistics
res <- desc_statby(ToothGrowth, measure.var = "len",
   grps = c("dose", "supp"))
head(res[, 1:10])




