library(asbio)


### Name: pairw.fried
### Title: Multiple pairwise comparison procedure to accompany a Friedman
###   test.
### Aliases: pairw.fried FR.multi.comp
### Keywords: htest univar

### ** Examples

#Data from Fox and Randall (1970)
tremors <- data.frame(freq = c(2.58, 2.63, 2.62, 2.85, 3.01, 2.7, 2.83, 3.15, 
3.43, 3.47, 2.78, 2.71, 3.02, 3.14, 3.35, 2.36, 2.49, 2.58, 2.86, 3.1, 2.67, 
2.96, 3.08, 3.32, 3.41, 2.43, 2.5, 2.85, 3.06, 3.07), weights = 
factor(rep(c(7.5, 5, 2.5, 1.25, 0), 6)), block = factor(rep (1 : 6, each = 5)))

fr <- with(tremors, pairw.fried(y = freq, x = weights, blocks = block, nblocks = 6, conf = .95))
fr
plot(fr, loc.meas = median, int = "IQR")
# you can also try: plot(fr, type = 2, las = 2)



