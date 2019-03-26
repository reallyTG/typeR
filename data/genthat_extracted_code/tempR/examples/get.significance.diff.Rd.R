library(tempR)


### Name: get.significance.diff
### Title: Get least significant differences for pairwise comparisons
### Aliases: get.significance.diff

### ** Examples

# toy data example
x <- data.frame(t10 = c(rep(NA, 15), rep(0, 50), rep(1, 20)),
                t15 = c(rep(NA,  4), rep(0, 61), rep(1, 20)),
                t20 = c(rep(0, 55), rep(1, 30)))
y <- data.frame(t10 = c(rep(NA, 15), rep(0, 50), rep(1, 20)),
                t15 = c(rep(NA,  0), rep(0, 21), rep(1, 64)),
                t20 = c( rep(0, 35), rep(1, 50)))
signif.xy <- get.significance.diff(x, y)
#compare with observed differences
diff.xy <- get.differences(x, y)
abs(diff.xy) > signif.xy

# real data example - differences between Bar 1 and Bar 2 on the attribute "Grain Flavour"
attributes <- unique(bars$attribute)
times <- get.times(colnames(bars)[-c(1:4)])
bar1 <- bars[bars$sample == 1 & bars$attribute == "Grain Flavour", -c(1:4)]
bar2 <- bars[bars$sample == 2 & bars$attribute == "Grain Flavour", -c(1:4)]
signif.1vs2 <- get.significance.diff(bar1, bar2)
# review observed difference in dominance rates vs. least significant differences
diff.1vs2 <- get.differences(bar1, bar2)
abs(diff.1vs2) > signif.1vs2
# differences between samples start at 1.1s and occur throughout the 45.0 evaluation period



