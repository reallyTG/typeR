library(quantreg)


### Name: kuantile
### Title: Quicker Sample Quantiles
### Aliases: kuantile kselect kunique
### Keywords: univar

### ** Examples

     kuantile(x <- rnorm(1001))# Extremes & Quartiles by default

     ### Compare different types
     p <- c(0.1,0.5,1,2,5,10,50)/100
     res <- matrix(as.numeric(NA), 9, 7)
     for(type in 1:9) res[type, ] <- y <- kuantile(x,  p, type=type)
     dimnames(res) <- list(1:9, names(y))
     ktiles <- res

     ### Compare different types
     p <- c(0.1,0.5,1,2,5,10,50)/100
     res <- matrix(as.numeric(NA), 9, 7)
     for(type in 1:9) res[type, ] <- y <- quantile(x,  p, type=type)
     dimnames(res) <- list(1:9, names(y))
     qtiles <- res

     max(abs(ktiles - qtiles))





