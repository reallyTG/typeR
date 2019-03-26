library(FatTailsR)


### Name: estimkiener11
### Title: Estimation Functions with 5, 7 or 11 Quantiles
### Aliases: estimkiener11 estimkiener7 estimkiener5

### ** Examples

    

require(timeSeries)

## Choose j in 1:16. Choose ord in 1:12 (7 is default)
j    <- 5
ord  <- 5
DS   <- getDSdata()
p11  <- elevenprobs(DS[[j]])
x11  <- quantile(DS[[j]], probs = p11, na.rm = TRUE, names = TRUE, type = 6) 
round(estimkiener11(x11, p11, ord), 3)

## Compare the results obtained with the 12 different values of ord on stock j
compare <- function(ord, x11, p11) {estimkiener11(x11, p11, ord)}
coefk   <- t(sapply(1:12, compare, x11, p11)) 
rownames(coefk) <- 1:12
mcoefk  <- apply(coefk, 2, mean) # the mean of the 12 results above
roundcoefk(rbind(coefk, mcoefk), 13)





