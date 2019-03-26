## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(fig.align = "center",
               fig.width = 6, fig.height = 5,
               dev.args = list(pointsize=10),
               par = TRUE,
               message = FALSE,
               warning = FALSE)

knit_hooks$set(par = function(before, options, envir)
  { if(before && options$fig.show != "none") 
       par(mar=c(4.1,4.1,1.1,1.1), mgp=c(3,1,0), tcl=-0.5)
})

## ------------------------------------------------------------------------
library(qcc)

## ------------------------------------------------------------------------
data(pistonrings)
diameter = with(pistonrings, qcc.groups(diameter, sample))
head(diameter)

q1 = qcc(diameter[1:25,], type="xbar", newdata=diameter[26:40,])
plot(q1, chart.all=FALSE)
plot(q1, add.stats=FALSE)
q1 = qcc(diameter[1:25,], type="xbar", newdata=diameter[26:40,],
         confidence.level=0.99)

## ------------------------------------------------------------------------
q1 = qcc(diameter[1:25,], type="xbar", newdata=diameter[26:40,], plot=FALSE)
(warn.limits = limits.xbar(q1$center, q1$std.dev, q1$sizes, 2))
plot(q1, restore.par = FALSE)
abline(h = warn.limits, lty = 3, col = "chocolate")

## ------------------------------------------------------------------------
q2 = qcc(diameter[1:25,], type="R")
summary(q2)
q3 = qcc(diameter[1:25,], type="R", newdata=diameter[26:40,])
summary(q3)

## ------------------------------------------------------------------------
q4 = qcc(diameter[1:25,], type="S")
summary(q4)
q5 = qcc(diameter[1:25,], type="S", newdata=diameter[26:40,])
summary(q5)

## ------------------------------------------------------------------------
out = c(9, 10, 30, 35, 45, 64, 65, 74, 75, 85, 99, 100)
diameter2 = with(pistonrings, qcc.groups(diameter[-out], sample[-out]))
summary(qcc(diameter2[1:25,], type="xbar"))
summary(qcc(diameter2[1:25,], type="R"))

## ------------------------------------------------------------------------
data(orangejuice)
q1 = with(orangejuice, 
          qcc(D[trial], sizes=size[trial], type="p"))
summary(q1)

q2 = with(orangejuice, 
          qcc(D[trial], sizes=size[trial], type="np"))
summary(q2)

## ------------------------------------------------------------------------
inc = setdiff(which(orangejuice$trial), c(15,23))
q2 = with(orangejuice, 
          qcc(D[inc], sizes=size[inc], type="p",
              newdata=D[!trial], newsizes=size[!trial]))

## ------------------------------------------------------------------------
data(orangejuice2)
q1 = with(orangejuice2,
          qcc(D[trial], sizes=size[trial], type="p", 
              newdata=D[!trial], newsizes=size[!trial]))
summary(q1)

## ------------------------------------------------------------------------
data(circuit)
q1 = with(circuit, 
          qcc(x[trial], sizes=size[trial], type="c"))
summary(q1)

## ------------------------------------------------------------------------
inc = setdiff(which(circuit$trial), c(6,20))
q2 = with(circuit, 
          qcc(x[inc], sizes=size[inc], type="c", labels=inc, 
              newdata=x[!trial], newsizes=size[!trial], newlabels=which(!trial)))
summary(q2)

q3 = with(circuit, 
          qcc(x[inc], sizes=size[inc], type="u", labels=inc, 
              newdata=x[!trial], newsizes=size[!trial], newlabels=which(!trial)))
summary(q3)

## ------------------------------------------------------------------------
data(pcmanufact)
q1 = with(pcmanufact, 
          qcc(x, sizes=size, type="u"))
summary(q1)

## ------------------------------------------------------------------------
# viscosity data (Montgomery, pag. 242)
x = c(33.75, 33.05, 34, 33.81, 33.46, 34.02, 33.68, 33.27, 33.49, 33.20,
       33.62, 33.00, 33.54, 33.12, 33.84)
q1 = qcc(x, type="xbar.one")
summary(q1)
q2 = qcc(x, type="xbar.one", std.dev = "SD")
summary(q2)

## ------------------------------------------------------------------------
stats.p.std = function(data, sizes)
{
  data = as.vector(data)
  sizes = as.vector(sizes)
  pbar = sum(data)/sum(sizes)
  z = (data/sizes - pbar)/sqrt(pbar*(1-pbar)/sizes)
  list(statistics = z, center = 0)
}

## ------------------------------------------------------------------------
sd.p.std = function(data, sizes, ...) { return(1) }

## ------------------------------------------------------------------------
limits.p.std = function(center, std.dev, sizes, conf)
{
  if(conf >= 1) 
    { lcl = -conf
      ucl = +conf 
  }
  else
    { if(conf > 0 & conf < 1)
        { nsigmas = qnorm(1 - (1 - conf)/2)
          lcl = -nsigmas
          ucl = +nsigmas }
      else stop("invalid 'conf' argument.") 
  }
  limits = matrix(c(lcl, ucl), ncol = 2)
  rownames(limits) = rep("", length = nrow(limits))
  colnames(limits) = c("LCL", "UCL")
  return(limits)
}

## ------------------------------------------------------------------------
# set unequal sample sizes
n = c(rep(50,5), rep(100,5), rep(25, 5))
# generate randomly the number of successes
x = rbinom(length(n), n, 0.2)
# plot the control chart with variable limits
summary(qcc(x, type="p", size=n))
# plot the standardized control chart
summary(qcc(x, type="p.std", size=n))

## ------------------------------------------------------------------------
data(pistonrings)
diameter = with(pistonrings, qcc.groups(diameter, sample))
q = qcc(diameter, type="xbar", nsigmas=3, plot=FALSE)
beta = oc.curves.xbar(q)
print(round(beta, digits=4))

data(orangejuice)
q = with(orangejuice, qcc(D[trial], sizes=size[trial], type="p", plot=FALSE))
beta = oc.curves(q)
print(round(beta, digits=4))

data(circuit)
q = with(circuit, qcc(x[trial], sizes=size[trial], type="c", plot=FALSE))
beta = oc.curves(q)
print(round(beta, digits=4))

## ------------------------------------------------------------------------
data(pistonrings)
diameter = with(pistonrings, qcc.groups(diameter, sample))

q1 = cusum(diameter[1:25,], decision.interval = 4, se.shift = 1)
summary(q1)

q2 = cusum(diameter[1:25,], newdata=diameter[26:40,])
summary(q2)
plot(q2, chart.all=FALSE)

## ------------------------------------------------------------------------
data(pistonrings)
diameter = with(pistonrings, qcc.groups(diameter, sample))

q1 = ewma(diameter[1:25,], lambda=0.2, nsigmas=3)
summary(q1)

q2 =  ewma(diameter[1:25,], lambda=0.2, nsigmas=2.7, 
            newdata=diameter[26:40,]) 
summary(q2)

x = c(33.75, 33.05, 34, 33.81, 33.46, 34.02, 33.68, 33.27, 
       33.49, 33.20, 33.62, 33.00, 33.54, 33.12, 33.84)
q3 =  ewma(x, lambda=0.2, nsigmas=2.7)
summary(q3)

## ------------------------------------------------------------------------
data(pistonrings)
diameter = with(pistonrings, qcc.groups(diameter, sample))

q1 = qcc(diameter[1:25,], type="xbar", nsigmas=3, plot=FALSE)
process.capability(q1, spec.limits=c(73.95,74.05))
process.capability(q1, spec.limits=c(73.95,74.05), target=74.02)
process.capability(q1, spec.limits=c(73.99,74.01))
process.capability(q1, spec.limits = c(73.99, 74.1))

## ------------------------------------------------------------------------
X1 = matrix(c(72, 56, 55, 44, 97, 83, 47, 88, 57, 26, 46, 
49, 71, 71, 67, 55, 49, 72, 61, 35, 84, 87, 73, 80, 26, 89, 66, 
50, 47, 39, 27, 62, 63, 58, 69, 63, 51, 80, 74, 38, 79, 33, 22, 
54, 48, 91, 53, 84, 41, 52, 63, 78, 82, 69, 70, 72, 55, 61, 62, 
41, 49, 42, 60, 74, 58, 62, 58, 69, 46, 48, 34, 87, 55, 70, 94, 
49, 76, 59, 57, 46), ncol = 4)
X2 = matrix(c(23, 14, 13, 9, 36, 30, 12, 31, 14, 7, 10, 
11, 22, 21, 18, 15, 13, 22, 19, 10, 30, 31, 22, 28, 10, 35, 18, 
11, 10, 11, 8, 20, 16, 19, 19, 16, 14, 28, 20, 11, 28, 8, 6, 
15, 14, 36, 14, 30, 8, 35, 19, 27, 31, 17, 18, 20, 16, 18, 16, 
13, 10, 9, 16, 25, 15, 18, 16, 19, 10, 30, 9, 31, 15, 20, 35, 
12, 26, 17, 14, 16), ncol = 4)
X = list(X1 = X1, X2 = X2) # a list of matrices, one for each variable

q = mqcc(X, type = "T2")
summary(q)
ellipseChart(q)
ellipseChart(q, show.id = TRUE)

q = mqcc(X, type = "T2", pred.limits = TRUE)

## ------------------------------------------------------------------------
q1 = qcc(X1, type = "xbar", confidence.level = q$confidence.level^(1/2))
summary(q1)
q2 = qcc(X2, type = "xbar", confidence.level = q$confidence.level^(1/2))
summary(q2)

## ------------------------------------------------------------------------
Xnew = list(X1 = matrix(NA, 10, 4), X2 =  matrix(NA, 10, 4))
for(i in 1:4)
   { x = MASS::mvrnorm(10, mu = q$center, Sigma = q$cov)
     Xnew$X1[,i] = x[,1]
     Xnew$X2[,i] = x[,2] 
   }
qq = mqcc(X, type = "T2", newdata = Xnew, pred.limits = TRUE)
summary(qq)

ellipseChart(qq, show.id = TRUE)

## ------------------------------------------------------------------------
Xnew = list(X1 = matrix(NA, 10, 4), X2 =  matrix(NA, 10, 4))
for(i in 1:4)
   { x = MASS::mvrnorm(10, mu = 1.2*q$center, Sigma = q$cov)
     Xnew$X1[,i] = x[,1]
     Xnew$X2[,i] = x[,2] 
   }
qq = mqcc(X, type = "T2", newdata = Xnew, pred.limits = TRUE)
summary(qq)

ellipseChart(qq, show.id = TRUE)

## ------------------------------------------------------------------------
data(boiler)

q1 = mqcc(boiler, type = "T2.single", confidence.level = 0.999)
summary(q1)

## ------------------------------------------------------------------------
boilerNew = MASS::mvrnorm(10, mu = q1$center, Sigma = q1$cov)
q2 = mqcc(boiler, type = "T2.single", confidence.level = 0.999, 
          newdata = boilerNew, pred.limits = TRUE)
summary(q2)

## ------------------------------------------------------------------------
boilerNew = MASS::mvrnorm(10, mu = 1.01*q1$center, Sigma = q1$cov)
q3 = mqcc(boiler, type = "T2.single", confidence.level = 0.999, 
          newdata = boilerNew, pred.limits = TRUE)
summary(q3)

## ------------------------------------------------------------------------
rob = MASS::cov.rob(boiler)
q4 = mqcc(boiler, type = "T2.single", center = rob$center, cov = rob$cov)
summary(q4)

## ------------------------------------------------------------------------
defect = c(80, 27, 66, 94, 33)
names(defect) = c("price code", "schedule date", "supplier code", "contact num.", "part num.")
pareto.chart(defect, ylab = "Error frequency")

## ------------------------------------------------------------------------
cause.and.effect(cause = list(Measurements = c("Micrometers", "Microscopes", "Inspectors"),
                              Materials    = c("Alloys", "Lubricants", "Suppliers"),
                              Personnel    = c("Shifts", "Supervisors", "Training", "Operators"),
                              Environment  = c("Condensation", "Moisture"),
                              Methods      = c("Brake", "Engager", "Angle"),
                              Machines     = c("Speed", "Lathes", "Bits", "Sockets")),
                 effect = "Surface Flaws")

## ---- echo = FALSE-------------------------------------------------------
set.seed(123) # set seed for reproducibility

## ------------------------------------------------------------------------
mu = 100
sigma_W = 10
epsilon = rnorm(500)
x = matrix(mu + sigma_W*epsilon, ncol=10, byrow=TRUE)
q = qcc(x, type="xbar")
q = qcc(x, type="R")
q = qcc(x, type="S")

## ------------------------------------------------------------------------
mu = 100
sigma_W = 10
sigma_B = 5
epsilon = rnorm(500)
u = as.vector(sapply(rnorm(50), rep, 10))
x = mu + sigma_B*u + sigma_W*epsilon
x = matrix(x, ncol=10, byrow=TRUE)
q = qcc(x, type="xbar")
q = qcc(x, type="R")
q = qcc(x, type="S")

## ------------------------------------------------------------------------
mu = 100
rho = 0.8
sigma_W = 10
sigma_B = 5
epsilon = rnorm(500)
u = rnorm(500)
W = rep(0,100)
for(i in 2:length(W))
    W[i] = rho*W[i-1] + sigma_B*u[i]
x = mu + sigma_B*u + sigma_W*epsilon
x = matrix(x, ncol=10, byrow=TRUE)
q = qcc(x, type="xbar")
q = qcc(x, type="R")
q = qcc(x, type="S")

## ------------------------------------------------------------------------
mu = 100
sigma_W = 10
epsilon = rnorm(120, sd=0.3)
W = c(-4, 0, 1, 2, 4, 2, 0, -2) # assumed workers cycle
W = rep(rep(W, rep(5,8)), 3)
x = mu + W + sigma_W*epsilon
x = matrix(x, ncol=5, byrow=TRUE)
q = qcc(x, type="xbar")
q = qcc(x, type="R")
q = qcc(x, type="S")

## ------------------------------------------------------------------------
mu = 100
sigma_W = 10
epsilon = rnorm(500)
W = rep(0.2*1:100, rep(5,100))
x = mu + W + sigma_W*epsilon
x = matrix(x, ncol=10, byrow=TRUE)
q = qcc(x, type="xbar")
q = qcc(x, type="R")
q = qcc(x, type="S")

## ------------------------------------------------------------------------
mu1 = 90
mu2 = 110
sigma_W = 10
epsilon = rnorm(500)
p = rbinom(50, 1, 0.5)
mu = mu1*p + mu2*(1-p)
x = rep(mu, rep(10, length(mu))) + sigma_W*epsilon
x = matrix(x, ncol=10, byrow=TRUE)
q = qcc(x, type="xbar")
q = qcc(x, type="R")
q = qcc(x, type="S")

## ------------------------------------------------------------------------
mu = rep(c(95,110,100,90), c(20,35,25,20))
sigma_W = 10
epsilon = rnorm(500)
x = rep(mu, rep(5, length(mu))) + sigma_W*epsilon
x = matrix(x, ncol=10, byrow=TRUE)
q = qcc(x, type="xbar")
q = qcc(x, type="R")
q = qcc(x, type="S")

