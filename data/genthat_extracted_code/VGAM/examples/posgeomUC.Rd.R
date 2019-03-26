library(VGAM)


### Name: Posgeom
### Title: Positive-Geometric Distribution
### Aliases: Posgeom dposgeom pposgeom qposgeom rposgeom
### Keywords: distribution

### ** Examples

prob <- 0.75; y <- rposgeom(n = 1000, prob)
table(y)
mean(y)  # Sample mean
1 / prob  # Population mean

(ii <- dposgeom(0:7, prob))
cumsum(ii) - pposgeom(0:7, prob)  # Should be 0s
table(rposgeom(100, prob))

table(qposgeom(runif(1000), prob))
round(dposgeom(1:10, prob) * 1000)  # Should be similar

## Not run: 
##D x <- 0:5
##D barplot(rbind(dposgeom(x, prob), dgeom(x, prob)),
##D         beside = TRUE, col = c("blue", "orange"),
##D         main = paste("Positive geometric(", prob, ") (blue) vs",
##D         " geometric(", prob, ") (orange)", sep = ""),
##D         names.arg = as.character(x), las = 1, lwd = 2) 
## End(Not run)



