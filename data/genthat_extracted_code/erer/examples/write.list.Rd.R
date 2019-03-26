library(erer)


### Name: write.list
### Title: Output and Write a List Object
### Aliases: write.list
### Keywords: manip

### ** Examples


h1 <- ts(data=cbind(1:24), start=c(2001, 1), frequency=12)
h2 <- ts(data=cbind(1:24, 25:48), start=c(2001, 1), frequency=12)
h3 <- ts(data=cbind(1:4, 5:8, 9:12), start=c(2001, 1), frequency=4)
colnames(h2) <- c("aa", "bb")
colnames(h3) <- c("cc", "dd", "ee")
h1; h2; h3

test <- list(t1 = h1, t2 = h2, t3 = h3)

## Not run: 
##D   # test.csv can be saved at a specific working directory
##D   getwd(); setwd("c:/aERER"); getwd()
##D   write.list(z = test, file = "test.csv")
## End(Not run)



