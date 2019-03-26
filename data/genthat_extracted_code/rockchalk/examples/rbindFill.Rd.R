library(rockchalk)


### Name: rbindFill
### Title: Stack together data frames
### Aliases: rbindFill

### ** Examples

set.seed(123123)
N <- 10000
dat <- genCorrelatedData2(N, means = c(10, 20, 5, 5, 6, 7, 9), sds = 3,
           stde = 3, rho = .2,  beta = c(1, 1, -1, 0.5))
dat1 <- dat
dat1$xcat1 <- factor(sample(c("a", "b", "c", "d"), N, replace=TRUE))
dat1$xcat2 <- factor(sample(c("M", "F"), N, replace=TRUE),
                    levels = c("M", "F"), labels = c("Male", "Female"))
dat1$y <- dat$y +
          as.vector(contrasts(dat1$xcat1)[dat1$xcat1, ] %*% c(0.1, 0.2, 0.3))
dat1$xchar1 <- rep(letters[1:26], length.out = N)
dat2 <- dat
dat1$x3 <- NULL
dat2$x2 <- NULL
dat2$xcat2 <- factor(sample(c("M", "F"), N, replace=TRUE),
                     levels = c("M", "F"), labels = c("Male", "Female"))
dat2$xcat3 <- factor(sample(c("K1", "K2", "K3", "K4"), N, replace=TRUE))
dat2$xchar1 <- "1"
dat3 <- dat
dat3$x1 <- NULL
dat3$xcat3 <-  factor(sample(c("L1", "L2", "L3", "L4"), N, replace=TRUE)) 
dat.stack <- rbindFill(dat1, dat2, dat3)
str(dat.stack)

## Possible BUG alert about base::rbind and plyr::rbind.fill
## Demonstrate the problem of a same-named variable that is factor in one and
## an ordered variable in the other
dat5 <- data.frame(ds = "5", x1 = rnorm(N),
                   xcat1 = gl(20, 5, labels = LETTERS[20:1]))
dat6 <- data.frame(ds = "6", x1 = rnorm(N),
                   xcat1 = gl(20, 5, labels = LETTERS[1:20], ordered = TRUE))
## rbind reduces xcat1 to factor, whether we bind dat5 or dat6 first.
stack1 <- base::rbind(dat5, dat6)
str(stack1)
## note xcat1 levels are ordered T, S, R, Q
stack2 <- base::rbind(dat6, dat5)
str(stack2)
## xcat1 levels are A, B, C, D
## stack3 <- plyr::rbind.fill(dat5, dat6)
## str(stack3)
## xcat1 is a factor with levels T, S, R, Q ...
## stack4 <- plyr::rbind.fill(dat6, dat5)
## str(stack4)
## oops, xcat1 is ordinal with levels A < B < C < D
## stack5 <- rbindFill(dat5, dat6)



