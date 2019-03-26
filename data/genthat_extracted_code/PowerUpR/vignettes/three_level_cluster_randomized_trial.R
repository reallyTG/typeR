## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(PowerUpR)

## ----  message=FALSE, eval=FALSE-----------------------------------------
#  install.packages("PowerUpR")
#  library(PowerUpR)

## ---- message=FALSE, fig.width=7, fig.height=5---------------------------
mdes <- mdes.cra3r3(power=.80, rho2=.06, rho3=.18,
                    g3=1, r21=.55, r22=.50, r23=.45,
                    p=.40, n=10, J=2, K=83)

plot(mdes, ypar = "mdes", xlim = c(30, 150),
     main = "MDES as a Function of Number of Schools",
     locate = TRUE)

## ---- message=FALSE, fig.width=7, fig.height=5---------------------------
power <- power.cra3r3(es=.23, rho2=.06, rho3=.18,
                      g3=1, r21=.55, r22=.50, r23=.45,
                      p=.40, n=10, J=2, K=83)

plot(power, ypar = "power", xlim = c(30, 150),
     main = "Statistical Power as a Function of Number of Schools",
     locate = TRUE)


