## ----setup, include = FALSE, warning=FALSE-------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(knitr)
library(reshape)
library(trinROC)
options(digits=5)

## ----load_data-----------------------------------------------------------
data(cancer)
str(cancer)

## ----start---------------------------------------------------------------
out <- trinROC.test(dat = cancer[,c("trueClass","Class2")])
out

## ----output1-------------------------------------------------------------
out[ c("estimate", "Summary", "CovMat")]

## ----rocsing-------------------------------------------------------------
ROCsin <- trinROC.test(dat = cancer[,c(1,3)])
VUSsin <- trinVUS.test(dat = cancer[,c(1,3)])
bootsin <- boot.test(dat = cancer[,c(1,3)], n.boot = 250)

c( ROCsin$p.value, VUSsin$p.value, bootsin$p.value)

## ----rocsin2-------------------------------------------------------------
(x1 <- with(cancer, cancer[trueClass=="healthy", 3]))
(y1 <- with(cancer, cancer[trueClass=="intermediate", 3]))
(z1 <- with(cancer, cancer[trueClass=="diseased", 3]))
ROCsin2 <- trinROC.test(x1, y1, z1)
all.equal(ROCsin, ROCsin2, check.attributes = FALSE)

## ----roccomp-------------------------------------------------------------
ROCcomp <- trinROC.test(dat = cancer[,c(1,3,5)], paired = TRUE)
ROCcom  <- trinROC.test(dat = cancer[,c(1,3,5)])

ROCcomp$p.value
ROCcom$p.value
# is equal to:
x2 <- with(cancer, cancer[trueClass=="healthy", 5])
y2 <- with(cancer, cancer[trueClass=="intermediate", 5])
z2 <- with(cancer, cancer[trueClass=="diseased", 5])
ROCcomp2 <- trinROC.test(x1, y1, z1, x2, y2, z2, paired = TRUE)


## ----emppow, fig.width = 6.5, fig.asp = .4-------------------------------
require( ggplot2)
require( MASS)
N <- 25
reps <- 99                    # Is set to 1000 in the paper
rho <- 0.5                    # paired setting if rho!=0

sd.y1 <- 1.25;  sd.y2 <- 1.5  # this corresponds to medium crossing
sd.z1 <- 1.5;   sd.z2 <- 2

Vus <- c(0.2, 0.25, 0.3, 0.35, 0.4, 0.45)
lVus <- length(Vus)

result <- matrix(0, lVus, reps)
tmp <- findmu(sdy=sd.y1, sdz=sd.z1, VUS=Vus[1])
mom1 <- tmp[,2]
names(mom1) <- tmp[,1]
for (m in 1:lVus){            # cycle over different VUS
  mom2 <- findmu(sdy=sd.y2, sdz=sd.z2, VUS=Vus[m])[,2]
  names(mom2) <- tmp[,1]
  for( i in 1:reps) {         # cycle over replicates
    SigmaX <- matrix(c(1, rho, rho, 1), 2, 2)
    SigmaY <- matrix(c(sd.y1^2, sd.y1*sd.y2*rho,
                       sd.y1*sd.y2*rho, sd.y2^2), 2, 2)
    SigmaZ <- matrix(c(sd.z1^2, sd.z1*sd.z2*rho,
                       sd.z1*sd.z2*rho, sd.z2^2), 2, 2)
    x <- mvrnorm(N, c(0, 0), SigmaX)
    y <- mvrnorm(N, c(mom1["muy"], mom2["muy"]), SigmaY)
    z <- mvrnorm(N, c(mom1["muz"], mom2["muz"]), SigmaZ)

    MT <- trinROC.test(x1 = x[,1], y1 = y[,1], z1 = z[,1],
                       x2 = x[,2], y2 = y[,2], z2 = z[,2], paired = (rho!=0))
    result[m,i] <- MT$p.value
  }
}

empPow <- data.frame(x = Vus, value = rowMeans(result<0.05))
ggplot(data = empPow, aes(x = Vus, y = value)) + geom_line() + geom_point() +
    ylab("Empirical Power") + scale_y_continuous(breaks = c(0.05, 0.25, 0.5, 1))


## ----roc.eda, fig.width = 6.5, fig.asp = .4------------------------------
data( cancer)
roc.eda(dat = cancer[,c(1,5)], type = "trinormal", plotVUS = FALSE, saveVUS = T)
roc.eda(dat = cancer[,c(1,5)], type = "empirical", sep.dens = TRUE, scatter = TRUE, verbose = FALSE)

## is equal to:
# x <- with(cancer, cancer[trueClass=="healthy", 5])
# y <- with(cancer, cancer[trueClass=="intermediate", 5])
# z <- with(cancer, cancer[trueClass=="diseased", 5])
# roc.eda(x, y, z, type = "trinormal")

## ----figs, echo = FALSE, out.width="45%", fig.lp="fig:figs", fig.cap="Empirical and trinormal ROC surfaces", fig.show='hold'----
include_graphics(c("Figures//empVUS.png", "Figures//trinVUS.png"))

## ----emp.vus-------------------------------------------------------------
data( cancer)
x <- with(cancer, cancer[trueClass=="healthy", 5])
y <- with(cancer, cancer[trueClass=="intermediate", 5])
z <- with(cancer, cancer[trueClass=="diseased", 5])
emp.vus(x, y, z)
trinVUS.test(x, y, z)$estimate
trinROC.test(x, y, z)$estimate[1]


## ----boxcox--------------------------------------------------------------
set.seed(712)
x <- rchisq(20, 2)
y <- rchisq(20, 6)
z <- rchisq(20, 10)
boxcoxROC(x, y, z)

## ----roc3.test-----------------------------------------------------------
out <- roc3.test(cancer[,1:8], type = c("ROC", "VUS"), paired = TRUE)
out[c(1,3)]

## ----roc3.test_padjust---------------------------------------------------
roc3.test(cancer[,1:8], type = c("ROC", "VUS"), paired = TRUE,
                    p.adjust = TRUE)$P.values$trinROC
out$P.values$trinROC

