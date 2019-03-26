
library("mlt")
set.seed(29)

n <- 100
p <- 2
x <- matrix(runif(n * p), nrow = n)
beta <- c(1, -1)
y <- factor(rbinom(n, size = 1, prob = plogis(x %*% beta)))
df <- data.frame(y = y, x)

m1 <- glm(y ~ X1 + X2, data = df, family = binomial())
coef(m1)

m <- ctm(~ y, shift = ~ X1 + X2, todist = "Logis", data = df)
m2 <- mlt(m, data = df, fixed = c("y1" = 0))
coef(m2)

max(abs(coef(m1) + coef(m2)[-2]))

logLik(m1)
logLik(m2)

### compare multinomial models; iris was not good because
### of complete separation
library("nnet")

n <- 5000
p <- 1
x <- as.data.frame(matrix(runif(n * p), nrow = n))
x$y <- cut(x$V1, breaks = c(0, .25, .5, .75, 1))
x$V1 <- x$V1 + rnorm(n, sd = .1)
x$V1 <- x$V1 - min(x$V1)

m1 <- multinom(y ~ ., data = x)
coef(m1)
logLik(m1)

ox <- x
ox$y <- ordered(ox$y)

r <- as.basis(ox$y)

fm <- as.formula(paste("~ ", paste(names(x)[grep("^V", names(x))], collapse = "+")))
### don't scale, otherwise comparison with glm() is impossible
m <- ctm(r, interacting = as.basis(fm, data = ox, scale = FALSE),
           todistr = "Logis")
m2 <- mlt(m, data = ox, scale = TRUE)
coef(m2)
logLik(m2)

s <- sort(unique(ox$y))

pp2 <- predict(m2, newdata = ox, q = s, type = "density")

pp1 <- predict(m1, newdata = x, type = "prob")

max(abs(pp1 - t(pp2)))

cf1 <- coef(glm(I(y %in% levels(y)[1]) ~ V1, data = x, family = binomial()))
cf2 <- coef(glm(I(y %in% levels(y)[1:2]) ~ V1, data = x, family = binomial()))
cf3 <- coef(glm(I(y %in% levels(y)[1:3]) ~ V1, data = x, family = binomial()))

logLik(m2, parm = c(rbind(cf1, cf2, cf3)))

