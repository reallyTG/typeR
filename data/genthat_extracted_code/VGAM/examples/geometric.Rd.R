library(VGAM)


### Name: geometric
### Title: Geometric (Truncated and Untruncated) Distributions
### Aliases: geometric truncgeometric
### Keywords: models regression

### ** Examples

gdata <- data.frame(x2 = runif(nn <- 1000) - 0.5)
gdata <- transform(gdata, x3 = runif(nn) - 0.5,
                          x4 = runif(nn) - 0.5)
gdata <- transform(gdata, eta  = -1.0 - 1.0 * x2 + 2.0 * x3)
gdata <- transform(gdata, prob = logit(eta, inverse = TRUE))
gdata <- transform(gdata, y1 = rgeom(nn, prob))
with(gdata, table(y1))
fit1 <- vglm(y1 ~ x2 + x3 + x4, geometric, data = gdata, trace = TRUE)
coef(fit1, matrix = TRUE)
summary(fit1)

# Truncated geometric (between 0 and upper.limit)
upper.limit <- 5
tdata <- subset(gdata, y1 <= upper.limit)
nrow(tdata)  # Less than nn
fit2 <- vglm(y1 ~ x2 + x3 + x4, truncgeometric(upper.limit),
             data = tdata, trace = TRUE)
coef(fit2, matrix = TRUE)

# Generalized truncated geometric (between lower.limit and upper.limit)
lower.limit <- 1
upper.limit <- 8
gtdata <- subset(gdata, lower.limit <= y1 & y1 <= upper.limit)
with(gtdata, table(y1))
nrow(gtdata)  # Less than nn
fit3 <- vglm(y1 - lower.limit ~ x2 + x3 + x4,
             truncgeometric(upper.limit - lower.limit),
             data = gtdata, trace = TRUE)
coef(fit3, matrix = TRUE)



