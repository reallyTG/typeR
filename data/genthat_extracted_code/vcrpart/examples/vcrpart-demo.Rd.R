library(vcrpart)


### Name: vcrpart-demo
### Title: Synthetic data sets
### Aliases: vcrpart-demo vcrpart_1 vcrpart_2 vcrpart_3 unemp
### Keywords: datasets

### ** Examples

## --------------------------------------------------------- #
## generating 'vcrpart_1'
## --------------------------------------------------------- #

## create skeletton
set.seed(1)
vcrpart_1 <- data.frame(id = factor(rep(1:50, each = 4)),
                        wave = rep(1:4, 50),
                        treat = sample(0:1, 200, TRUE))

## add partitioning variables
vcrpart_1$z1 <- rnorm(50)[vcrpart_1$id]
vcrpart_1$z2 <- rnorm(200)
vcrpart_1$z3 <- factor(sample(1:2, 50, TRUE)[vcrpart_1$id])
vcrpart_1$z4 <- factor(sample(1:2, 200, TRUE))

## simulate response
eta <- 2 * vcrpart_1$treat * (vcrpart_1$z4 == "1")
eta <- eta + rnorm(50)[vcrpart_1$id] + rlogis(200)
vcrpart_1$y <- cut(-eta, c(-Inf, -1, 1, Inf), 1:3,
                   ordered_result = TRUE)


## --------------------------------------------------------- #
## generating 'vcrpart_2'
## --------------------------------------------------------- #

set.seed(1)
vcrpart_2 <- data.frame(x1 = rnorm(100),
                        x2 = rnorm(100),
                        z1 = factor(sample(1:3, 100, TRUE)),
                        z2 = factor(sample(1:3, 100, TRUE)))
vcrpart_2$y <- vcrpart_2$x1 * (vcrpart_2$z1 == "2") +
  2 * vcrpart_2$x1 * (vcrpart_2$z1 == "3")
vcrpart_2$y <- vcrpart_2$y + rnorm(100)

## --------------------------------------------------------- #
## generating 'vcrpart_3'
## --------------------------------------------------------- #

set.seed(1)
vcrpart_3 <- data.frame(x1 = rnorm(100),
                        z1 = runif(100, -pi/2, pi/2))
vcrpart_3$y <- vcrpart_3$x1 * sin(vcrpart_3$z1) + rnorm(100)

## --------------------------------------------------------- #
## generating 'unemp'
## --------------------------------------------------------- #

## create skeletton
set.seed(1)
unemp <- data.frame(PID = factor(rep(1:50, each = 4)),
                    UNEMP = rep(c(0, 0, 1, 1), 50),
               	    YEAR = rep(2001:2004, 50))

## add partitioning variables
unemp$AGE <- runif(50, 25, 60)[unemp$PID] + unemp$YEAR - 2000
unemp$FISIT <- ordered(sample(1:5, 200, replace = TRUE))
unemp$GENDER <- factor(sample(c("female", "male"), 50, replace = TRUE)[unemp$PID])
unemp$UEREGION <- runif(50, 0.02, 0.1)[unemp$PID]

## simulate response
eta <- 2 * unemp$UNEMP * (unemp$FISIT == "1" | unemp$FISIT == "2")
eta <- eta + rnorm(50)[unemp$PID] + rlogis(200)
unemp$GHQL <- cut(-eta, c(-Inf, -1, 0, 1, Inf), 1:4,
                  ordered_result = TRUE)




