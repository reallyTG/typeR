library(adagio)


### Name: maxempty
### Title: Maximally Empty Rectangle Problem
### Aliases: maxempty

### ** Examples

N <- 100; set.seed(8237)
x <- runif(N); y <- runif(N)
R <- maxempty(x, y, c(0,1), c(0,1))
R
# $area
# [1] 0.08238793
# $rect
# [1] 0.7023670 0.1797339 0.8175771 0.8948442

## Not run: 
##D plot(x, y, pch="+", xlim=c(0,1), ylim=c(0,1), col="darkgray",
##D       main = "Maximally empty rectangle")
##D rect(0, 0, 1, 1, border = "red", lwd = 1, lty = "dashed")
##D do.call(rect, as.list(R$rect))
##D grid()
## End(Not run)



