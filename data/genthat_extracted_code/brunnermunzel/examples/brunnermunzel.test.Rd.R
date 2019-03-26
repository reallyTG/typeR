library(brunnermunzel)


### Name: brunnermunzel.test
### Title: brunnermunzel.test
### Aliases: brunnermunzel.test brunnermunzel.test.default
###   brunnermunzel.test.formula brunnermunzel.test.matrix
###   brunnermunzel.test.table

### ** Examples

## Hollander & Wolfe (1973), 29f.
## Hamilton depression scale factor measurements in 9 patients with
##  mixed anxiety and depression, taken at the first (x) and second
##  (y) visit after initiation of a therapy (administration of a
##  tranquilizer).
x <- c(1.83,  0.50,  1.62,  2.48, 1.68, 1.88, 1.55, 3.06, 1.30)
y <- c(0.878, 0.647, 0.598, 2.05, 1.06, 1.29, 1.06, 3.14, 1.29)

brunnermunzel.test(x, y)

##       Brunner-Munzel Test
## data:  x and y
## Brunner-Munzel Test Statistic = -1.4673, df = 15.147, p-value = 0.1628
## 95 percent confidence interval:
##  -0.02962941  0.59753064
## sample estimates:
## P(X<Y)+.5*P(X=Y)
##        0.2839506


## Formula interface.
dat <- data.frame(
    value = c(x, y),
    group = factor(rep(c("x", "y"), c(length(x), length(y))),
                   levels = c("x", "y"))
)

brunnermunzel.test(value ~ group, data = dat)

##       Brunner-Munzel Test
##
## data:  value by group
## Brunner-Munzel Test Statistic = -1.4673, df = 15.147, p-value = 0.1628
## 95 percent confidence interval:
##  -0.02962941  0.59753064
## sample estimates:
## P(X<Y)+.5*P(X=Y) 
##        0.2839506 


## Pain score on the third day after surgery for 14 patients under
## the treatment Y and 11 patients under the treatment N
## (see Brunner and Munzel, 2000; Neubert and Brunner, 2007).

Y <- c(1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 4, 1, 1)
N <- c(3, 3, 4, 3, 1, 2, 3, 1, 1, 5, 4)

brunnermunzel.test(Y, N)

##       Brunner-Munzel Test
## data: Y and N
## Brunner-Munzel Test Statistic = 3.1375,  df = 17.683, p-value = 0.005786
## 95 percent confidence interval:
##  0.5952169 0.9827052
## sample estimates:
## P(X<Y)+.5*P(X=Y)
##        0.788961

## Formula interface.
dat <- data.frame(
    value = c(Y, N),
    group = factor(rep(c("Y", "N"), c(length(Y), length(N))),
                   levels = c("Y", "N"))
)

brunnermunzel.test(value ~ group, data = dat)

##       Brunner-Munzel Test
##
## data:  value by group
## Brunner-Munzel Test Statistic = 3.1375, df = 17.683, p-value =
## 0.005786
## 95 percent confidence interval:
##  0.5952169 0.9827052
## sample estimates:
## P(X<Y)+.5*P(X=Y)
##         0.788961


## Matrix or Table interface.
##
dat1 <- matrix(c(4, 4, 2, 1, 5, 4), nr = 2, byrow = TRUE)
dat2 <- as.table(dat1)

brunnermunzel.test(dat1)  # matrix

##       Brunner-Munzel Test
## data:  Group1 and Group2
## Brunner-Munzel Test Statistic = 1.5511, df = 16.961, p-value =
## 0.1393
## 95 percent confidence interval:
##  0.4351213 0.9248787
## sample estimates:
## P(X<Y)+.5*P(X=Y)
##             0.68

brunnermunzel.test(dat2)  # table

##       Brunner-Munzel Test
## data:  A and B
## Brunner-Munzel Test Statistic = 1.5511, df = 16.961, p-value =
## 0.1393
## 95 percent confidence interval:
##  0.4351213 0.9248787
## sample estimates:
## P(X<Y)+.5*P(X=Y)
##             0.68




