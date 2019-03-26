library(chinese.misc)


### Name: m2doc
### Title: Rewrite Terms and Frequencies into Many Files
### Aliases: m2doc

### ** Examples

s <- sample(1:5, 20, replace = TRUE)
m <- matrix(s, nrow = 5)
colnames(m) <- c("r", "text", "mining", "data")
m2doc(m)



