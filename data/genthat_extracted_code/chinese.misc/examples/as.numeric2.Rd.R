library(chinese.misc)


### Name: as.numeric2
### Title: An Enhanced Version of as.numeric
### Aliases: as.numeric2

### ** Examples

# Try to coerce data frame
a <- c(55, 66, 77, 88, 66, 77, 88)
b <- factor(a)
df <- data.frame(a, b)
as.numeric2(df, a*2)
# Try a list
l <- list(a, a*2)
as.numeric2(l)
# Try a list of lists
l2 <- list(l, l)
as.numeric2(l2)



