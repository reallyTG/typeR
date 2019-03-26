library(mefa)


### Name: mefaCrosstab
### Title: Cross Tabulate an Object of Class 'stcs'
### Aliases: mefaCrosstab
### Keywords: manip

### ** Examples

x <- data.frame(sample = LETTERS[c(1,1,2,2,3,4)],
    species = c(letters[c(5,5,5,6,7)], "zero.pseudo"),
    count = c(1,2,10,3,4,0), segment = letters[c(8,9,8,9,8,8)])
y <- stcs(x)
mefaCrosstab(y)
mefaCrosstab(y, segment = TRUE)
mefaCrosstab(y, segment = TRUE, nested = TRUE)
## Examples for non-integer data
y[1:5, 3] <- y[1:5, 3] + 0.123
mefaCrosstab(y)
mefaCrosstab(y, segment = TRUE)



