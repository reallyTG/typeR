library(lmtest)


### Name: USDistLag
### Title: US Macroeconomic Data
### Aliases: USDistLag
### Keywords: datasets

### ** Examples

## Willam H. Greene, Econometric Analysis, 2nd Ed.
## Chapter 7
## load data set, p. 221, Table 7.7
data(USDistLag)

## fit distributed lag model, p.221, Example 7.8
usdl <- na.contiguous(cbind(USDistLag, lag(USDistLag, k = -1)))
colnames(usdl) <- c("con", "gnp", "con1", "gnp1")

## C(t) = b0 + b1*Y(t) + b2*C(t-1) + u
fm <- lm(con ~ gnp + con1, data = usdl)
summary(fm)
vcov(fm)



