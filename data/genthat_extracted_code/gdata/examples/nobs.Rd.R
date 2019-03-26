library(gdata)


### Name: nobs
### Title: Compute the Number of Non-missing Observations
### Aliases: nobs nobs.data.frame nobs.default nobs.lm
### Keywords: attribute

### ** Examples

x <- c(1,2,3,5,NA,6,7,1,NA )
length(x)
nobs(x)

df <- data.frame(x=rnorm(100), y=rnorm(100))
df[1,1] <- NA
df[1,2] <- NA
df[2,1] <- NA

nobs(df)

fit <- lm(y ~ x, data=df)
nobs(fit)



