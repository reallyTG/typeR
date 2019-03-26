library(PMwR)


### Name: pricetable
### Title: Price Table
### Aliases: pricetable [.pricetable

### ** Examples

m <- 3
n <- 2
price <- array(c(1:m, 1:m + 100), dim = c(m,n))
colnames(price) <- LETTERS[1:n]
pt <- pricetable(price, timestamp = 1:m)
##   A   B
## 1 1 101
## 2 2 102
## 3 3 103

pt[ , "A"]
##   A
## 1 1
## 2 2
## 3 3

pt[ , c("X", "A", "X")]
##    x A  x
## 1 NA 1 NA
## 2 NA 2 NA
## 3 NA 3 NA

pt[ , c("X", "A", "X"), missing = 0]
##   X A X
## 1 0 1 0
## 2 0 2 0
## 3 0 3 0

pt[c(0, 1.5, 4), , missing = "locf"]
##      A   B
## 0   NA  NA
## 1.5  2 102
## 4    3 103



