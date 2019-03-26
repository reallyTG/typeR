library(wakefield)


### Name: hair
### Title: Generate Random Vector of Hair Colors
### Aliases: hair
### Keywords: hair

### ** Examples

hair(10)
v <- table(hair(10000))
lbs <- paste0(names(v), "\n", round(100*v/sum(v), 1), "%")
pie(v, col = replace(names(v), 3, "yellow"), labels = lbs)



