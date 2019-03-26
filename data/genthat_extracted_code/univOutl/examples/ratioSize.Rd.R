library(univOutl)


### Name: ratioSize
### Title: Identifies outliers on ratios and filter them by a size measure
### Aliases: ratioSize
### Keywords: univar survey

### ** Examples


set.seed(444)
x1 <- rnorm(30, 50, 5)
set.seed(555)
rr <- runif(30, 0.9, 1.2)
rr[10] <- 2
x2 <- x1 * rr

out <- ratioSize(numerator = x2, denominator = x1)
out

out <- ratioSize(numerator = x2, denominator = x1,
                 return.dataframe = TRUE)
head(out$data)

out <- ratioSize(numerator = x2, denominator = x1,
                 size.th = 65, return.dataframe = TRUE)
head(out$data)


	



