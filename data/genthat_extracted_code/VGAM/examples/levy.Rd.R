library(VGAM)


### Name: levy
### Title: Levy Distribution Family Function
### Aliases: levy
### Keywords: models regression

### ** Examples

nn <- 1000; loc1 <- 0; loc2 <- 10
myscale <- 1  # log link ==> 0 is the answer
ldata <- data.frame(y1 = loc1 + myscale/rnorm(nn)^2,  # Levy(myscale, a)
                    y2 = rlevy(nn, loc = loc2, scale = exp(+2)))

# Cf. Table 1.1 of Nolan for Levy(1,0)
with(ldata, sum(y1 > 1) / length(y1))  # Should be 0.6827
with(ldata, sum(y1 > 2) / length(y1))  # Should be 0.5205

fit1 <- vglm(y1 ~ 1, levy(location = loc1), data = ldata, trace = TRUE)
coef(fit1, matrix = TRUE)
Coef(fit1)
summary(fit1)
head(weights(fit1, type = "work"))

fit2 <- vglm(y2 ~ 1, levy(location = loc2), data = ldata, trace = TRUE)
coef(fit2, matrix = TRUE)
Coef(fit2)
c(median = with(ldata, median(y2)), fitted.median = head(fitted(fit2), 1))



