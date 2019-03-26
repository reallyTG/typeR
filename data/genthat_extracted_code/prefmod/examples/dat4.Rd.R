library(prefmod)


### Name: dat4
### Title: Data (paired comparisons): dat4
### Aliases: dat4
### Keywords: datasets

### ** Examples

str(dat4)

# to get a general idea we use the histogram plot
old_par <- par(mfrow = c(2, 3))
for(i in 1:6){ barplot(table(dat4[, i])) }
par(old_par)



