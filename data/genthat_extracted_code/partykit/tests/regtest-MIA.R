
library("partykit")
set.seed(29)

n <- 100
x <- 1:n/n
y <- rnorm(n, mean = (x < .5) + 1)
xna <- x
xna[xna < .2] <- NA
d <- data.frame(x = x, y = y)
dna <- data.frame(x = xna, y = y)

(t1 <- ctree(y ~ x, data = d))
(t2 <- ctree(y ~ x, data = dna))
(t3 <- ctree(y ~ x, data = dna, control = ctree_control(MIA = TRUE)))

predict(t1, type = "node")[is.na(xna)]
predict(t2, type = "node")[is.na(xna)]
predict(t3, type = "node")[is.na(xna)]

xna <- x
xna[xna > .8] <- NA
d <- data.frame(x = x, y = y)
dna <- data.frame(x = xna, y = y)

(t1 <- ctree(y ~ x, data = d))
(t2 <- ctree(y ~ x, data = dna))
(t3 <- ctree(y ~ x, data = dna, control = ctree_control(MIA = TRUE)))

(n1 <- predict(t1, type = "node"))
(n2 <- predict(t2, type = "node"))
(n3 <- predict(t3, type = "node"))
table(n1, n2)
table(n1, n3)

d$x <- as.factor(cut(d$x, breaks = 0:5 / 5))
dna$x <- as.factor(cut(dna$x, breaks = 0:5 / 5))

(t1 <- ctree(y ~ x, data = d))
(t2 <- ctree(y ~ x, data = dna))
(t3 <- ctree(y ~ x, data = dna, control = ctree_control(MIA = TRUE)))

(n1 <- predict(t1, type = "node"))
(n2 <- predict(t2, type = "node"))
(n3 <- predict(t3, type = "node"))
table(n1, n2)
table(n1, n3)
