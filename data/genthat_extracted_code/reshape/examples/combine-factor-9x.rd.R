library(reshape)


### Name: combine_factor
### Title: Combine factor levels
### Aliases: combine_factor
### Keywords: manip

### ** Examples
df <- data.frame(a = LETTERS[sample(5, 15, replace=TRUE)], y = rnorm(15))  
combine_factor(df$a, c(1,2,2,1,2))
combine_factor(df$a, c(1:4, 1))
(f <- reorder(df$a, df$y))
percent <- tapply(abs(df$y), df$a, sum)
combine_factor(f, c(order(percent)[1:3]))


