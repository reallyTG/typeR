library(metR)


### Name: stat_subset
### Title: Subset values
### Aliases: stat_subset StatSubset
### Keywords: datasets

### ** Examples


library(ggplot2)
ggplot(data.table::melt(volcano), aes(Var1, Var2)) +
    geom_contour(aes(z = value)) +
    stat_subset(aes(subset = value >= 150 & value <= 160),
                shape = 3, color = "red")




