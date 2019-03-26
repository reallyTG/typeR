library(PASWR2)


### Name: FCD
### Title: Fat Cats
### Aliases: FCD
### Keywords: datasets

### ** Examples

# checking.plots()?
p <- ggplot(data = FCD, aes(x = diet, y = weight))
p + geom_violin(fill = "blue")
aov(weight ~ diet, data = FCD)



