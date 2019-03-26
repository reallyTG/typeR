library(tempR)


### Name: convert.tcategory
### Title: Convert Temporal Category data
### Aliases: convert.tcategory

### ** Examples

X <- rbind(c(3.18, 6.83), c(8.46, 11.09), c(18.61, 21.80))
in.scores <- c(7, 6, 5)
times <- seq(0, 25, by = 0.01)
Xnew <- convert.tcategory(X, in.scores, times)
Xnew



