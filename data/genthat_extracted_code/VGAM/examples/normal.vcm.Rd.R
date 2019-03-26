library(VGAM)


### Name: normal.vcm
### Title: Univariate Normal Distribution as a Varying-Coefficient Model
### Aliases: normal.vcm
### Keywords: models regression

### ** Examples

ndata <- data.frame(x2 = runif(nn <- 2000))
# Note that coeff1 + coeff2 + coeff5 == 1. So try a "multilogit" link.
myoffset <- 10
ndata <- transform(ndata,
           coeff1 = 0.25,  # "multilogit" link
           coeff2 = 0.25,  # "multilogit" link
           coeff3 = exp(-0.5),  # "loge" link
# "logoff" link:
           coeff4 = logoff(+0.5, offset = myoffset, inverse = TRUE),
           coeff5 = 0.50,  # "multilogit" link
           coeff6 = 1.00,  # "identitylink" link
           v2 = runif(nn),
           v3 = runif(nn),
           v4 = runif(nn),
           v5 = rnorm(nn),
           v6 = rnorm(nn))
ndata <- transform(ndata,
           Coeff1 =          0.25 - 0 * x2,
           Coeff2 =          0.25 - 0 * x2,
           Coeff3 =   logit(-0.5  - 1 * x2, inverse = TRUE),
           Coeff4 =  loglog( 0.5  - 1 * x2, inverse = TRUE),
           Coeff5 =          0.50 - 0 * x2,
           Coeff6 =          1.00 + 1 * x2)
ndata <- transform(ndata,
                   y1 = coeff1 * 1 +
                        coeff2 * v2 +
                        coeff3 * v3 +
                        coeff4 * v4 +
                        coeff5 * v5 +
                        coeff6 * v6 + rnorm(nn, sd = exp(0)),
                   y2 = Coeff1 * 1 +
                        Coeff2 * v2 +
                        Coeff3 * v3 +
                        Coeff4 * v4 +
                        Coeff5 * v5 +
                        Coeff6 * v6 + rnorm(nn, sd = exp(0)))

# An intercept-only model
fit1 <- vglm(y1 ~ 1,
             form2 = ~ 1 + v2 + v3 + v4 + v5 + v6,
             normal.vcm(link.list = list("(Intercept)" = "multilogit",
                                         "v2"          = "multilogit",
                                         "v3"          = "loge",
                                         "v4"          = "logoff",
                                         "(Default)"   = "identitylink",
                                         "v5"          = "multilogit"),
                        earg.list = list("(Intercept)" = list(),
                                         "v2"          = list(),
                                         "v4"          = list(offset = myoffset),
                                         "v3"          = list(),
                                         "(Default)"   = list(),
                                         "v5"          = list()),
                        zero = c(1:2, 6)),
             data = ndata, trace = TRUE)
coef(fit1, matrix = TRUE)
summary(fit1)
# This works only for intercept-only models:
multilogit(rbind(coef(fit1, matrix = TRUE)[1, c(1, 2)]), inverse = TRUE)

# A model with covariate x2 for the regression coefficients
fit2 <- vglm(y2 ~ 1 + x2,
             form2 = ~ 1 + v2 + v3 + v4 + v5 + v6,
             normal.vcm(link.list = list("(Intercept)" = "multilogit",
                                         "v2"          = "multilogit",
                                         "v3"          = "logit",
                                         "v4"          = "loglog",
                                         "(Default)"   = "identitylink",
                                         "v5"          = "multilogit"),
                        earg.list = list("(Intercept)" = list(),
                                         "v2"          = list(),
                                         "v3"          = list(),
                                         "v4"          = list(),
                                         "(Default)"   = list(),
                                         "v5"          = list()),
                        zero = c(1:2, 6)),
             data = ndata, trace = TRUE)

coef(fit2, matrix = TRUE)
summary(fit2)



