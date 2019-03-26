library(epiR)


### Name: epi.ccc
### Title: Concordance correlation coefficient
### Aliases: epi.ccc
### Keywords: univar

### ** Examples


## EXAMPLE 1:
set.seed(seed = 1234)
method1 <- rnorm(n = 100, mean = 0, sd = 1)
method2 <- method1 + runif(n = 100, min = -0.25, max = 0.25)

## Add some missing values:
method1[50] <- NA
method2[75] <- NA

tmp <- data.frame(method1, method2)
tmp.ccc <- epi.ccc(method1, method2, ci = "z-transform", conf.level = 0.95, 
   rep.measure = FALSE)

tmp.lab <- data.frame(lab = paste("CCC: ", 
   round(tmp.ccc$rho.c[,1], digits = 2), " (95% CI ", 
   round(tmp.ccc$rho.c[,2], digits = 2), " - ",
   round(tmp.ccc$rho.c[,3], digits = 2), ")", sep = ""))

z <- lm(method2 ~ method1)
alpha <- summary(z)$coefficients[1,1]
beta <-  summary(z)$coefficients[2,1]
tmp.lm <- data.frame(alpha, beta)

## Concordance correlation plot:
## Not run: 
##D library(ggplot2)
##D 
##D ggplot(tmp, aes(x = method1, y = method2)) + 
##D    geom_point() +
##D    geom_abline(intercept = 0, slope = 1) +
##D    geom_abline(data = tmp.lm, aes(intercept = alpha, slope = beta), 
##D       linetype = "dashed") +
##D    xlim(0, 3) +
##D    ylim(0, 3) +
##D    xlab("Method 1") +
##D    ylab("Method 2") +
##D    geom_text(data = tmp.lab, x = 0.5, y = 2.95, label = tmp.lab$lab) + 
##D    coord_fixed(ratio = 1 / 1)
##D 
##D ## In this plot the dashed line represents the line of perfect concordance. 
##D ## The solid line represents the reduced major axis.  
## End(Not run)


## EXAMPLE 2:
## Bland and Altman plot (Figure 2 from Bland and Altman 1986):
x <- c(494,395,516,434,476,557,413,442,650,433,417,656,267,
   478,178,423,427)

y <- c(512,430,520,428,500,600,364,380,658,445,432,626,260,
   477,259,350,451)

tmp.ccc <- epi.ccc(x, y, ci = "z-transform", conf.level = 0.95, 
   rep.measure = FALSE)
tmp <- data.frame(mean = tmp.ccc$blalt[,1], delta = tmp.ccc$blalt[,2])

## Not run: 
##D library(ggplot2)
##D 
##D ggplot(tmp.ccc$blalt, aes(x = mean, y = delta)) + 
##D   geom_point() +
##D   geom_hline(data = tmp.ccc$sblalt, aes(yintercept = lower), linetype = 2) +
##D   geom_hline(data = tmp.ccc$sblalt, aes(yintercept = upper), linetype = 2) +
##D   geom_hline(data = tmp.ccc$sblalt, aes(yintercept = est), linetype = 1) +
##D   xlab("Average PEFR by two meters (L/min)") +
##D   ylab("Difference in PEFR (L/min)") +
##D   xlim(0,800) +
##D   ylim(-150,150)     
## End(Not run)


## EXAMPLE 3:
## Setting limits of agreement when your data are skewed. See Euser et al. 
## (2008) for details.
x <- c(0,210,15,90,0,0,15,0,0,0,15,0,15,0,0,0,0,15,0,0,15,135,0,0,15,
   120,30,15,30,0,0,5235,780,1275,10515,1635,1905,1830,720,450,225,420,
   300,15,285,0,225,525,675,5280,465,270,0,1485,15,420,0,60,0,0,0,750,
   570,0)
y <- c(0,70,0,0,0,0,35,0,0,0,0,0,0,35,0,0,0,0,0,0,35,35,70,0,0,140,35,
   105,0,0,0,1190,385,1190,6930,560,1260,700,840,0,105,385,245,35,105,
   0,140,350,350,3640,385,350,0,1505,0,630,70,0,0,140,0,420,490,0)   
   
crude.ccc <- epi.ccc(x, y, ci = "z-transform", 
   conf.level = 0.95, rep.measure = FALSE)

## Not run: 
##D library(ggplot2)
##D 
##D ggplot(crude.ccc$blalt, aes(x = mean, y = delta)) + 
##D   geom_point() +
##D   geom_hline(data = crude.ccc$sblalt, aes(yintercept = lower), linetype = 2) +
##D   geom_hline(data = crude.ccc$sblalt, aes(yintercept = upper), linetype = 2) +
##D   geom_hline(data = crude.ccc$sblalt, aes(yintercept = est), linetype = 1) +
##D   xlab("Average of the two measurements") +
##D   ylab("Difference in the two measurements") +
##D   xlim(0,8000) +
##D   ylim(-8000,8000)
## End(Not run)

## In the above plot the spread of the differences increases with increasing 
## mean of the observations. The Bland Altman limits of agreement should be 
## calculated on a log scale.

logx <- log(x + 50, base = 10)
logy <- log(y + 50, base = 10)

log10.ccc <- epi.ccc(x = logx, y = logy, ci = "z-transform", 
   conf.level = 0.95, rep.measure = FALSE)

## Transform the limits of agreement back to the original scale by taking 
## anti-logs. If the limits of agreement for Z = log10(x) are between -a 
## and +a, with a = 1.96 * s, the ratio between two measures on the original 
## scale is between 10^-a and 10^a. See page 979 of Euser et al. (2008). 

a <- 1.96 * log10.ccc$sblalt$delta.sd

## For a given value for the mean Xbar, it can be shown that x - y is between 
## -2Xbar(10^a - 1) / (10^a + 1) and +2Xbar(10^a - 1) / (10^a + 1):

Xbar = seq(from = 0, to = 8000, by = 100)
Xbar.low <- (-2 * Xbar * (10^a - 1)) / (10^a + 1)
Xbar.upp <- (+2 * Xbar * (10^a - 1)) / (10^a + 1)
limits <- data.frame(mean = Xbar, lower = Xbar.low, upper = Xbar.upp)

## Not run: 
##D library(ggplot2)
##D 
##D ggplot(crude.ccc$blalt, aes(x = mean, y = delta)) + 
##D   geom_point() +
##D   geom_line(data = limits, aes(x = mean, y = lower), linetype = 2) +
##D   geom_line(data = limits, aes(x = mean, y = upper), linetype = 2) +
##D   geom_line(data = limits, aes(x = mean, y = 0), linetype = 1) +
##D   xlab("Average of the two measurements") +
##D   ylab("Difference in the two measurements") +
##D   xlim(0,8000) +
##D   ylim(-8000,8000)
## End(Not run)



