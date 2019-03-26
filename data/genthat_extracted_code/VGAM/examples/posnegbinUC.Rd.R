library(VGAM)


### Name: Posnegbin
### Title: Positive-Negative Binomial Distribution
### Aliases: Posnegbin dposnegbin pposnegbin qposnegbin rposnegbin
### Keywords: distribution

### ** Examples

munb <- 5; size <- 4; n <- 1000
table(y <- rposnegbin(n, munb = munb, size = size))
mean(y)  # sample mean
munb / (1 - (size / (size + munb))^size)  # population mean
munb / pnbinom(0, mu = munb, size = size, lower.tail = FALSE)  # same as before

x <- (-1):17
(ii <- dposnegbin(x, munb = munb, size = size))
max(abs(cumsum(ii) - pposnegbin(x, munb = munb, size = size)))  # Should be 0

## Not run: 
##D x <- 0:10
##D barplot(rbind(dposnegbin(x, munb = munb, size = size),
##D                  dnbinom(x, mu   = munb, size = size)),
##D         beside = TRUE, col = c("blue","green"),
##D         main = paste("dposnegbin(munb = ", munb, ", size = ", size, ") (blue) vs",
##D                      " dnbinom(mu = ", munb, ", size = ", size, ") (green)", sep = ""),
##D         names.arg = as.character(x)) 
## End(Not run)

# Another test for pposnegbin()
nn <- 5000
mytab <- cumsum(table(rposnegbin(nn, munb = munb, size = size))) / nn
myans <- pposnegbin(sort(as.numeric(names(mytab))), munb = munb, size = size)
max(abs(mytab - myans))  # Should be 0



