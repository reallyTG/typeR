library(chinese.misc)


### Name: word_cor
### Title: Word Correlation in DTM/TDM
### Aliases: word_cor

### ** Examples

set.seed(1)
s <- sample(1:10, 100, replace = TRUE)
m <- matrix(s, nrow = 20)
myword<- c("alpha", "apple", "cake", "data", "r")
colnames(m) <- myword
mycor1 <- word_cor(m, myword)
mycor2 <- word_cor(m, myword, method = "pearson", min = 0.1, p = 0.4)
mt <- t(m)
mycor3 <- word_cor(mt, myword, type = "T", method = "spearman", p = 0.5)



