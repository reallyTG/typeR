library(equate)


### Name: px
### Title: Percentile Ranks and Cumulative Frequencies
### Aliases: px px.default px.freqtab fx fx.default fx.freqtab
### Keywords: univar

### ** Examples


x <- as.freqtab(ACTmath[, 1:2], drop = TRUE)
y <- as.freqtab(ACTmath[, c(1, 3)], drop = TRUE)

# Percentile ranks for the x scale
round(px(x), 3)

# Percentile ranks in y for x each score
round(px(x, y = y), 3)

# Cumulative frequency distribution for x
round(fx(x), 3)




