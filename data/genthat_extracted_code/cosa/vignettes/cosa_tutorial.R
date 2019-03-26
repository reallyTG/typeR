## ----setup, include=FALSE, warning=FALSE---------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(cosa)

## ----eval = FALSE--------------------------------------------------------
#  install.packages("cosa")
#  library(cosa)

## ---- message=FALSE, fig.width=7, fig.height=5---------------------------
# CRT('rhots = 0')
# cost constrained - optimize p and n2
crt <- cosa.crd2r2(rhots = 0,
                   constrain = "cost", cost = 12500, 
                   cn1 = c(5, 2), cn2 = c(50, 20),
                   es = .20,  power = .80, rho2 = .20,
                   g2 = 5, r21 = .20, r22 = .30,
                   p = NULL, n1 = 24,  n2 = NULL)
# CRD
# cost constrained - optimize n2
crd <- cosa.crd2r2(constrain = "cost", cost = 12500,
                   cn1 = c(5, 2), cn2 = c(50, 20),
                   es = .20,  power = .80, rho2 = .20,
                   g2 = 5, r21 = .20, r22 = .30,
                   p = .387, n1 = 24,  n2 = NULL)

# example plots
par(mfrow = c(1, 2), mai = c(1, .9, .5, .2))
# compare minimum detectable effect size and 95% CI
plot(crt, ypar = "mdes", xpar = "n2",
     ylim = c(0, 1), xlim = c(10, 200), 
     ylab = "MDES (with Power = .80)", xlab = "Number of Clusters",
     main = "CRT", locate = TRUE)
plot(crd, ypar = "mdes", xpar = "n2",
     ylim = c(0, 1), xlim = c(10, 200),
     ylab = "MDES (with Power = .80)", xlab = "Number of Clusters",
     main = "CRD", locate = TRUE)
# compare statistical power 
plot(crt, ypar = "power", xpar = "n2",
     ylim = c(0, 1), xlim = c(10, 200), 
     ylab = "Power (for ES = .20)", xlab = "Number of Clusters",
     main = "CRT", locate = TRUE)
plot(crd, ypar = "power", xpar = "n2",
     ylim = c(0, 1), xlim = c(10, 200), 
     ylab = "Power (for ES = .20)", xlab = "Number of Clusters",
     main = "CRD", locate = TRUE)


## ---- message=FALSE------------------------------------------------------
# CRT('rhots = 0')
# cost constrained - optimize p and n2
cosa.crd2r2(rhots = 0,
            constrain = "es", es = .20,
            cn1 = c(5, 2), cn2 = c(50, 20),
            power = .80, rho2 = .20,
            g2 = 5, r21 = .20, r22 = .30,
            p = NULL, n1 = 24,  n2 = NULL)

# CRD
# cost constrained - optimize n2
cosa.crd2r2(constrain = "es", es = .20,
            power = .80, rho2 = .20,
            cn1 = c(5, 2), cn2 = c(50, 20),
            g2 = 5, r21 = .20, r22 = .30,
            p = .386, n1 = 24,  n2 = NULL)

## ---- message=FALSE------------------------------------------------------
# CRT('rhots = 0')
# cost constrained - optimize p and n2
cosa.crd2r2(rhots = 0, 
            constrain = "power", power = .80,
            cn1 = c(5, 2), cn2 = c(50, 20),
            es = .20, rho2 = .20,
            g2 = 5, r21 = .20, r22 = .30,
            p = NULL, n1 = 24,  n2 = NULL)
# the cost reduction for using an unbalanced design might be trivial
# fix p = .50 to obtain the cost under the balanced design for comparison
cosa.crd2r2(rhots = 0, 
            constrain = "power", power = .80,
            cn1 = c(5, 2), cn2 = c(50, 20),
            es = .20, rho2 = .20,
            g2 = 5, r21 = .20, r22 = .30,
            p = .50, n1 = 24,  n2 = NULL)

# CRD
# cost constrained - optimize n2
cosa.crd2r2(constrain = "power", power = .80,
            cn1 = c(5, 2), cn2 = c(50, 20),
            es = .20, rho2 = .20,
            g2 = 5, r21 = .20, r22 = .30,
            p = .386, n1 = 24,  n2 = NULL)

