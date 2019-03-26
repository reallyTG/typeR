
library("partykit")

set.seed(29)
n <- 1000
z <- runif(n)
y <- rnorm(n, mean = c(-1, 1)[(z > 0.5) + 1], sd = 3)
d <- data.frame(y = y, y2 = factor(y > median(y)), 
                z = z)

c1 <- ctree(y2 ~ z, data = d, control = ctree_control(nmax = Inf, alpha = .5))
c2 <- ctree(y2 ~ z, data = d, control = ctree_control(nmax = 25, alpha = .5))
c3 <- ctree(y2 ~ z, data = d, control = ctree_control(nmax = nrow(d), alpha = .5))
c4 <- ctree(y2 ~ z, data = d, control = ctree_control(nmax = 100, alpha = .5))

all.equal(predict(c1, type = "node"), predict(c3, type = "node"))

p1 <- predict(c1, type = "prob")
p2 <- predict(c2, type = "prob")
p3 <- predict(c3, type = "prob")
p4 <- predict(c4, type = "prob")

### binomial log-lik
sum(log(p1[cbind(1:nrow(d), unclass(d$y2))]))
sum(log(p2[cbind(1:nrow(d), unclass(d$y2))]))
sum(log(p3[cbind(1:nrow(d), unclass(d$y2))]))
sum(log(p4[cbind(1:nrow(d), unclass(d$y2))]))

c1 <- ctree(y ~ z, data = d, control = ctree_control(nmax = c("yx" = Inf, "z" = 25), alpha = .5))
