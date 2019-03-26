library(bfsl)


### Name: bfsl
### Title: Calculates the Best-fit Straight Line
### Aliases: bfsl

### ** Examples

x = pearson_york$x
y = pearson_york$y
sd_x = 1/sqrt(pearson_york$w_x)
sd_y = 1/sqrt(pearson_york$w_y)
bfsl(x, y, sd_x, sd_y)

fit = bfsl(pearson_york)
plot(fit)




