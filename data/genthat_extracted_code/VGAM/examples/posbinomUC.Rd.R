library(VGAM)


### Name: Posbinom
### Title: Positive-Binomial Distribution
### Aliases: Posbinom dposbinom pposbinom qposbinom rposbinom
### Keywords: distribution

### ** Examples

prob <- 0.2; size <- 10
table(y <- rposbinom(n = 1000, size, prob))
mean(y)  # Sample mean
size * prob / (1 - (1 - prob)^size)  # Population mean

(ii <- dposbinom(0:size, size, prob))
cumsum(ii) - pposbinom(0:size, size, prob)  # Should be 0s
table(rposbinom(100, size, prob))

table(qposbinom(runif(1000), size, prob))
round(dposbinom(1:10, size, prob) * 1000)  # Should be similar

## Not run: 
##D  barplot(rbind(dposbinom(x = 0:size, size, prob),
##D                            dbinom(x = 0:size, size, prob)),
##D         beside = TRUE, col = c("blue", "green"),
##D         main = paste("Positive-binomial(", size, ",",
##D                       prob, ") (blue) vs",
##D         " Binomial(", size, ",", prob, ") (green)", sep = ""),
##D         names.arg = as.character(0:size), las = 1) 
## End(Not run)

# Simulated data example
nn <- 1000; sizeval1 <- 10; sizeval2 <- 20
pdata <- data.frame(x2 = seq(0, 1, length = nn))
pdata <- transform(pdata, prob1  = logit(-2 + 2 * x2, inverse = TRUE),
                          prob2  = logit(-1 + 1 * x2, inverse = TRUE),
                          sizev1 = rep(sizeval1, len = nn),
                          sizev2 = rep(sizeval2, len = nn))
pdata <- transform(pdata, y1 = rposbinom(nn, size = sizev1, prob = prob1),
                          y2 = rposbinom(nn, size = sizev2, prob = prob2))
with(pdata, table(y1))
with(pdata, table(y2))
# Multiple responses
fit2 <- vglm(cbind(y1, y2) ~ x2, posbinomial(multiple.responses = TRUE),
             trace  = TRUE, data = pdata, weight = cbind(sizev1, sizev2))
coef(fit2, matrix = TRUE)



