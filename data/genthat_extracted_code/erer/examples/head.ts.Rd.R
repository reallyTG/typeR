library(erer)


### Name: head
### Title: Return the first or last part of time series data
### Aliases: head.ts tail.ts
### Keywords: methods

### ** Examples

h1 <- ts(data=cbind(1:24), start=c(2001, 1), frequency=12)
h2 <- ts(data=cbind(1:24, 25:48), start=c(2001, 1), frequency=12)
h3 <- ts(data=cbind(1:4, 5:8, 9:12), start=c(2001, 1), frequency=4)
colnames(h2) <- c("aa", "bb")
colnames(h3) <- c("cc", "dd", "ee")
h1; h2; h3

h1; head(h1); tail(h1, 28)
h2; head(h2); tail(h2, 50)
h3; head(h3, 2); tail(h3); tail(h3, 8)

data(daBed); head(daBed); tail(daBed)



