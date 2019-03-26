## ---- echo=FALSE, message= FALSE, warning=FALSE--------------------------
require(pifpaf)
require(ggplot2)
set.seed(3256)

## ------------------------------------------------------------------------
require(datasets)
ozone_exposure  <- na.omit(airquality$Ozone) 
ozone_exposure  <- as.data.frame(ozone_exposure) 

## ------------------------------------------------------------------------
sampling_weights <- c(rep(1/232, 58), rep(0.75/58, 58))

## ------------------------------------------------------------------------
thetahat <- 0.17
thetavar <- 0.00025

## ------------------------------------------------------------------------
rr <- function(X, theta){ exp(theta*X/5) }

## ------------------------------------------------------------------------
paf(X = ozone_exposure, thetahat = thetahat, rr = rr, weights = sampling_weights)

## ------------------------------------------------------------------------
cft <- function(X){0.5*X - 1}

## ------------------------------------------------------------------------
pif(X = ozone_exposure, thetahat = thetahat, rr = rr, cft = cft, weights = sampling_weights)

## ------------------------------------------------------------------------
paf.confidence(X = ozone_exposure, thetahat = thetahat, thetavar = thetavar, rr = rr, weights = sampling_weights, nsim = 200)

## ------------------------------------------------------------------------
pif.confidence(X = ozone_exposure, thetahat = thetahat, thetavar = thetavar, rr = rr, cft = cft, weights = sampling_weights, nsim = 200)

## ---- fig.width=7, fig.height=4------------------------------------------
counterfactual.plot(X = ozone_exposure, cft = cft, weights = sampling_weights, n=250)

## ---- fig.width=7, fig.height=4------------------------------------------

paf.plot(X = ozone_exposure, thetalow = 0, thetaup = 1/pi, rr = rr, weights = sampling_weights, mpoints = 25, nsim = 15)

## ---- fig.width=7, fig.height=4------------------------------------------
pif.plot(X = ozone_exposure, thetalow = 0, thetaup = 1/pi, rr = rr, cft = cft, weights = sampling_weights, mpoints = 25, nsim = 15)

## ---- fig.width=7, fig.height=4------------------------------------------
paf.sensitivity(X = ozone_exposure, thetahat = thetahat, rr = rr, weights = sampling_weights, nsim = 10, mremove = 20)

## ---- fig.width=7, fig.height=4------------------------------------------
pif.sensitivity(X = ozone_exposure, thetahat = thetahat, rr = rr, weights = sampling_weights, nsim = 10, mremove = 20)

## ---- fig.width=7, fig.height=4------------------------------------------
#Change the counterfactual function to specify the parameters involved
cft_sensitivity <- function(X, a, b){a*X - b}

## ---- fig.width=7, fig.height=4------------------------------------------
#Do the sensitivity analysis
pif.heatmap(X = ozone_exposure, thetahat = thetahat, rr = rr, cft = cft_sensitivity, mina = 0.5, maxa = 0.75, minb = 0, maxb = 1, weights = sampling_weights, nmesh = 5)

## ------------------------------------------------------------------------
require(datasets)
tobacco_consumption <- as.data.frame(esoph$tobgp)

## ------------------------------------------------------------------------
#Thetas
thetahat <- c(1, 1.59, 2.57, 4.11)

#Relative Risk
rr       <- function(X, theta){
  
  #Create empty vector to fill with RR's
  r_risk <- rep(NA, nrow(X))
  
  #Select by cases
  r_risk[which(X == "0-9g/day")] <- theta[1]
  r_risk[which(X == "10-19")]    <- theta[2]
  r_risk[which(X == "20-29")]    <- theta[3]
  r_risk[which(X == "30+")]      <- theta[4]
  
  return(r_risk)
}

## ------------------------------------------------------------------------
paf(tobacco_consumption, thetahat, rr)

## ------------------------------------------------------------------------
cft <- function(X){
  
  #Create empty matrix to fill with RR's
  new_tobacco <- matrix(NA, nrow = nrow(X), ncol = 1)
  
  #Select by cases
  new_tobacco[which(X == "0-9g/day")] <- "0-9g/day"  #These remain
  new_tobacco[which(X == "10-19")]    <- "10-19"     #the same
  new_tobacco[which(X == "20-29")]    <- "10-19"
  new_tobacco[which(X == "30+")]      <- "10-19"
  
  # X in relative risk is received as a data.frame
  new_tobacco <- as.data.frame(new_tobacco)
  return(new_tobacco)
}

## ------------------------------------------------------------------------
pif(tobacco_consumption, thetahat, rr, cft)

## ------------------------------------------------------------------------
thetavar <- diag(c(0.119, 0.041, 0.001, 0.093))

## ------------------------------------------------------------------------
paf.confidence(X = tobacco_consumption, thetahat = thetahat, thetavar = thetavar, rr = rr,  confidence_method = "bootstrap", nsim = 200)

## ------------------------------------------------------------------------
pif.confidence(X = tobacco_consumption, thetahat = thetahat, thetavar = thetavar, rr = rr, cft = cft, confidence_method = "bootstrap", nsim = 200)

## ---- fig.width=7, fig.height=4------------------------------------------
counterfactual.plot(tobacco_consumption, cft)

## ---- fig.width=7, fig.height=4------------------------------------------
paf.sensitivity(tobacco_consumption, thetahat=thetahat, rr, 
                nsim = 10, mremove = 20)

## ---- fig.width=7, fig.height=4------------------------------------------
pif.sensitivity(tobacco_consumption, thetahat=thetahat, rr=rr, cft = cft,
                nsim = 10, mremove = 20)

## ------------------------------------------------------------------------
sbp <- data.frame("Region"   = c("Afr D", "Afr E", "Amr A", "Amr B", "Amr D",
                                 "Emr B", "Emr D", "Eur A", "Eur B", "Eur C",
                                 "Sear B", "Sear D", "Wpr A", "Wpr B"), 
                  "SBP_mean" = c(123, 121, 114, 115, 117, 126, 121, 
                                 122, 122, 125, 120, 117, 120, 115),
                  "SBP_sd"   = c(20, 13, 14, 15, 15, 15, 15, 
                                 15, 16, 17, 15, 14, 15, 16))

## ------------------------------------------------------------------------
thetahat <- 0.71
thetavar <- 0.002

#Notice that the theoretical minimum risk value is 115 and not 0
rr       <- function(X, theta){ theta*(X - 115)^2/121 + 1} 

## ------------------------------------------------------------------------
#Get mean and variance
afr_mean <- as.data.frame(subset(sbp, Region == "Afr E")$SBP_mean)
afr_var  <- subset(sbp, Region == "Afr E")$SBP_sd^2 

#Calculate paf using approximate method
paf(X = afr_mean, thetahat = thetahat, rr = rr, method = "approximate", Xvar = afr_var, check_rr = FALSE)

## ------------------------------------------------------------------------
paf.confidence(X = afr_mean, thetahat = thetahat,  thetavar = thetavar, rr = rr, method = "approximate", Xvar = afr_var, check_rr = FALSE, nsim = 200)

## ------------------------------------------------------------------------
cft <- function(X){X - 5}

## ------------------------------------------------------------------------
pif(X = afr_mean, thetahat = thetahat, rr = rr, cft = cft, method = "approximate", Xvar = afr_var, check_rr = FALSE)

## ------------------------------------------------------------------------
pif.confidence(X = afr_mean, thetahat = thetahat, rr = rr, cft = cft, method = "approximate", Xvar = afr_var, check_rr = FALSE, thetavar = thetavar, nsim = 200)

## ---- fig.width=7, fig.height=4------------------------------------------
paf.plot(X = afr_mean, thetalow = 0, thetaup = 1, rr = rr, method = "approximate", Xvar = afr_var,  check_rr = FALSE, mpoints = 25, nsim = 15)

## ---- fig.width=7, fig.height=4------------------------------------------
pif.plot(X = afr_mean, thetalow = 0, thetaup = 1, rr = rr, cft = cft, method = "approximate", Xvar = afr_var,  check_rr = FALSE, mpoints = 25, nsim = 15)

## ------------------------------------------------------------------------
problem_data <- data.frame(Proportions   = c(  0.56,       0.21,       0.23),
                           Mean          = c(  23.2,       27.1,       31.9),
                           Variance      = c(  1.00,       0.87,       1.12))

rownames(problem_data) <- c("Normal", "Overweight", "Obese")

## ------------------------------------------------------------------------
rr_normal     <- function(X, theta){theta}
rr_overweight <- function(X, theta){theta*X/25}
rr_obese      <- function(X, theta){exp(theta*X/30)}

## ------------------------------------------------------------------------
#Subpopulation PAF
paf_normal     <- paf(as.data.frame(problem_data["Normal","Mean"]), 1.00, rr = rr_normal, check_rr = FALSE, method = "approximate", Xvar = problem_data["Normal","Variance"])
paf_overweight <- paf(as.data.frame(problem_data["Overweight","Mean"]), 1.39, rr = rr_overweight, check_rr = FALSE, method = "approximate", Xvar = problem_data["Overweight","Variance"])
paf_obese      <- paf(as.data.frame(problem_data["Obese","Mean"]), 0.62, rr = rr_obese, check_rr = FALSE, method = "approximate", Xvar = problem_data["Obese","Variance"])

## ------------------------------------------------------------------------
#Population PAF
paf.combine(c(paf_normal, paf_overweight, paf_obese), problem_data$Proportions)

## ------------------------------------------------------------------------
#Data
set.seed(2374)
X        <- as.data.frame(rlnorm(100))
rr       <- function(X, theta){theta*X + 1}
cft      <- function(X){sqrt(X + 1)}
thetahat <- 0.1943

#Empirical
pif(X, thetahat, rr, cft, method = "empirical")

#Kernel
pif(X, thetahat, rr, cft, method = "kernel")

#Approximate
meanX <- as.data.frame(mean(X[,1]))
pif(meanX, thetahat, rr, cft, method = "approximate", Xvar = var(X))

## ---- fig.width=7, fig.height=4, echo = FALSE----------------------------

#Get a random variable distributed normally
X              <- rnorm(45)
Y              <- seq(-3,3, length.out = 100)
real_density   <- data.frame("Density" = dnorm(Y), "Axis" = Y)

#Approximate via kernel
kernel_density <- data.frame("Density" = density(X)$y, "Axis" = density(X)$x)

#Show the density
ggplot() + 
  geom_line(aes(x = Axis, y = Density, color = "Real density"), data = real_density) + 
  geom_line(aes(x = Axis, y = Density, color = "Kernel density"), data = kernel_density) +
  scale_color_manual("Type", values = c("Real density" = "purple",
                                        "Kernel density" = "tomato3")) +
  theme_classic() + xlab("X") + ggtitle("Real and approximate density of normal distribution from sample of size 45")


## ------------------------------------------------------------------------
set.seed(46)
X <- rlnorm(25)

## ---- fig.width=7, fig.height=4, echo = FALSE----------------------------

#Check kernel types
kernels         <- c("gaussian", "epanechnikov", "rectangular", 
                     "triangular", "biweight", "cosine", "optcosine")
color_k         <- rainbow(length(kernels))
names(color_k)  <- kernels 

#Data frame
kdata           <- data.frame(matrix(NA, 
                                     ncol = length(kernels) + 1, 
                                     nrow = 250))
colnames(kdata) <- c("X", kernels)
kdata$X         <- seq(-3, 8, length.out = 250)


#Create kernel densities
for(ktype in kernels){
    kernel_density  <- density(X, kernel = ktype)
    mat_approximate <- approx(kernel_density$x, kernel_density$y, 
                              kdata$X, rule = 2)
    kdata[ ,ktype]  <- mat_approximate$y
}

#Create plot
kplot  <- ggplot(kdata, aes(x = X)) 
for(ktype in kernels){
  kplot <- kplot + geom_line(aes_string(y = ktype, color = factor(ktype)))
}
kplot + scale_color_manual("Kernel type", values = color_k) + theme_classic() +
  ylab("Density")
  


## ------------------------------------------------------------------------
X        <- as.data.frame(X)
thetahat <- 1
thetavar <- 0.1
rr       <- function(X, theta){theta*X + 1}
cft      <- function(X){X/2}

#Rectangular kernel
pif.confidence(X, thetahat, rr, cft = cft, method = "kernel", ktype = "gaussian", thetavar = thetavar, nsim = 200)

#Gaussian kernel
pif.confidence(X, thetahat, rr, cft = cft, method = "kernel", ktype = "rectangular", thetavar = thetavar, nsim = 200)


## ------------------------------------------------------------------------
pif.confidence(X, thetahat, rr, cft = cft, method = "kernel", ktype = "rectangular", bw = "nrd", adjust = 2, n = 1000, thetavar = thetavar, nsim = 150)

## ------------------------------------------------------------------------
rr <- function(X, theta){ theta[1]*X^2/(X + 1) + theta[2]*X + 1}

## ------------------------------------------------------------------------
Xmean    <- as.data.frame(0.365)
Xvar     <- 0.25
thetahat <- c(0.32, 1/4)

## ------------------------------------------------------------------------
paf(Xmean, thetahat, rr, Xvar = Xvar, method = "approximate")

## ------------------------------------------------------------------------
paf(Xmean, thetahat, rr, Xvar = Xvar, method = "approximate", deriv.method = "Richardson", deriv.method.args = list(eps=0.03, d=0.0001, zero.tol=1.e-8, r=4, v=2))

## ------------------------------------------------------------------------
X <- as.data.frame(rnorm(100))
paf.confidence(X, 0.12, rr = function(X, theta){exp(theta*X)}, thetavar = 0.1, check_exposure = F, confidence_method = "inverse",force.min = FALSE, nsim = 200)

## ------------------------------------------------------------------------
paf.confidence(X, 0.12, rr = function(X, theta){exp(theta*X)}, thetavar = 0.1, check_exposure = F, confidence_method = "inverse", force.min = TRUE, nsim = 200)

## ----fig.width=7, fig.height=4-------------------------------------------
X        <- as.data.frame(rbeta(100, 1, 3))
rr       <- function(X, theta){theta*X^2 + 1}
cft      <- function(X){X/1.2}
thetalow <- 0
thetaup  <- 5
pif.plot(X = X, thetalow = thetalow, thetaup = thetaup, rr = rr, cft = cft, mpoints = 25, nsim = 15)

## ----fig.width=7, fig.height=4-------------------------------------------
pif.plot(X = X, thetalow = thetalow, thetaup = thetaup, rr = rr, cft = cft, method = "kernel", n = 1000, adjust = 2, ktype = "triangular", confidence_method = "bootstrap", confidence = 99,
         mpoints = 25, nsim = 15)

## ----fig.width=7, fig.height=4-------------------------------------------
pif.plot(X = X, thetalow = thetalow, thetaup = thetaup, rr = rr, cft = cft, colors = rainbow(2), xlab = "Exposure to hideous things.", ylab = "PIF PIF PIF!", title = "This analyisis is the best", mpoints = 25, nsim = 15)

## ----fig.width=7, fig.height=4-------------------------------------------
#require(ggplot2)
pif.plot(X = X, thetalow = thetalow, thetaup = thetaup, rr = rr, cft = cft, colors = rainbow(2),
         mpoints = 25, nsim = 15) + theme_dark()

## ----fig.width=7, fig.height=4-------------------------------------------
#Get sample
X        <- as.data.frame(sample(c("Exposed","Very exposed","Unexposed"), 540, 
                   replace = TRUE, prob = c(0.25, 0.05, 0.7)))

#Theta values
thetahat <- c(1.2, 7)

#RR defined for each category
rr       <- function(X, theta){
  Xnew <- matrix(1, ncol = ncol(X), nrow = nrow(X))
  Xnew[which(X[,1] == "Exposed"),1]      <- theta[1]
  Xnew[which(X[,1] == "Very exposed"),1] <- theta[2]
  return(Xnew)
}

#Counterfactual of stopping the very exposed
cft      <- function(X){
  Xcft                                   <- X
  Xcft[which(X[,1] == "Very exposed"),] <- "Unexposed"
  return(Xcft)
}

#Sensitivity analysis takes some time. 
pif.sensitivity(X = X, thetahat = thetahat, rr = rr, cft = cft, mremove = 18, nsim = 10)

## ----fig.width=7, fig.height=4-------------------------------------------
pif.sensitivity(X = X, thetahat = thetahat, rr = rr, cft = cft, nsim = 10, mremove = 18)

## ----fig.width=7, fig.height=4-------------------------------------------
pif.sensitivity(X = X, thetahat = thetahat, rr = rr, 
                legendtitle = "This is legendary",
                title = "This feels entitled", xlab = "A boring X axis",
                ylab = "A not so boring Y axis",
                nsim = 10, mremove = 18, colors = cm.colors(4)) +
  theme(axis.line = element_line(colour = "purple"))

## ----fig.width=7, fig.height=4-------------------------------------------
X        <- as.data.frame(runif(100, 0, 2*pi) + 1)
rr       <- function(X, theta){return(abs(X*cos(X + thetahat) + 2))}
thetahat <- pi
pif.heatmap(X = X, thetahat = thetahat, rr = rr, 
            check_rr = FALSE, check_integrals = FALSE, nmesh = 5)

## ----fig.width=7, fig.height=4-------------------------------------------
mina <- 0.5
maxa <- 1
minb <- -3
maxb <- -1
pif.heatmap(X = X, thetahat = thetahat, rr = rr, mina = mina, 
            maxa = maxa, minb = minb, maxb = maxb, check_rr = FALSE, 
            check_integrals = FALSE, nmesh = 5)

## ----fig.width=7, fig.height=4-------------------------------------------

#Notice that counterfactual here must be function of a and b
cft <- function(X, a, b){sin(a*X+b)}

#Counterfactual
pif.heatmap(X=X, thetahat = thetahat, rr = rr, 
            mina = mina, maxa = maxa, minb = minb, maxb = maxb,
            cft = cft, check_rr = FALSE, check_integrals = FALSE,  title = "PIF with counterfactual sin(aX+b)", nmesh = 5)

## ----fig.width=7, fig.height=4-------------------------------------------

#Notice that counterfactual here must be function of a and b
cft <- function(X, a, b){sin(a*X+b)}

#Counterfactual
pif.heatmap(X=X, thetahat = thetahat, rr = rr, 
            mina = mina, maxa = maxa, minb = 2, maxb = 2,
            cft = cft, check_rr = FALSE, check_integrals = FALSE, title = "PIF with counterfactual sin(aX+2)", nmesh = 5)

## ----fig.width=7, fig.height=4-------------------------------------------

pif.heatmap(X=X, thetahat = thetahat, rr = rr,
            nmesh = 5, title = "Twister counterfactual",
            xlab = "This is X", ylab = "This is not X",
            colors = rainbow(5), check_rr = FALSE, check_integrals = FALSE)

## ----fig.width=7, fig.height=4-------------------------------------------
#Get the exposure
X   <- as.data.frame(rnorm(1000, 150, 15))
cft <- function(X){0.35*X + 75}  

#Plot!
counterfactual.plot(X, cft)

## ----fig.width=7, fig.height=4-------------------------------------------
#Plot!
counterfactual.plot(X, cft, fill_limits = c(150, Inf)) 

## ----fig.width=7, fig.height=4-------------------------------------------
#Plot!
plot_cft <- counterfactual.plot(X, cft, fill_limits = c(150, Inf),
                                xlab  = "Usual SBP (mmHg)",
                                ylab  = "Proportion of population (%)",
                                legendtitle = "Distribution",
                                dnames = c("Current","After policy"),
                                title = paste0("Effect of a non-linear hazard function and choice",
                                               "\nof baseline on total population risk", 
                                               "\n(Fig 25 from Vander Hoorn et al)"),
                                fill = TRUE, colors = c("blue","purple")) 
plot_cft

## ----fig.width=7, fig.height=4-------------------------------------------
plot_cft + geom_segment(aes(x = 168, y = 0.01, xend = 132, yend = 0.025), 
                        arrow = arrow(length = unit(0.25, "cm")))

## ----fig.width=7, fig.height=4-------------------------------------------
X   <- data.frame(Exposure = sample(c("Exposed","Unexposed"), 
                      100, replace = TRUE, prob = c(0.3, 0.7)))
cft <- function(X){

     #Find which indivuals are exposed
     exposed    <- which(X[,"Exposure"] == "Exposed")
     
     #Change 1/3 of exposed to unexposed
     reduced    <- sample(exposed, length(exposed)/3)
     X[reduced,"Exposure"] <- "Unexposed"
     
     return(X)
}  
counterfactual.plot(X, cft)

## ----fig.width=7, fig.height=4-------------------------------------------
counterfactual.plot(X, cft, x_axis_order = c("Unexposed", "Exposed"))

## ----fig.width=7, fig.height=4-------------------------------------------
#Same example as before but now exposed has been coded as 1 and unexposed 0
X   <- data.frame( Exposure = sample(c(1,0), 100, 
                    replace = TRUE, prob = c(0.3, 0.7)))

#Same counterfactual considering the new code
cft <- function(X){

     #Find which indivuals are exposed
     exposed    <- which(X[,"Exposure"] == 1)
     
     #Change 1/3 of exposed to unexposed
     reduced    <- sample(exposed, length(exposed)/3)
     X[reduced, "Exposure"] <- 0
     
     return(X)
}  

#One should specify exposure is discrete 
counterfactual.plot(X, cft, exposure.type = "discrete")

## ---- error = TRUE-------------------------------------------------------
X  <- data.frame(rlnorm(100))
rr <- function(X){X + 1}
paf(X, 0, rr)

## ------------------------------------------------------------------------
X  <- data.frame(rlnorm(100))
rr <- function(X, theta){X + 1}
paf(X, 0, rr)

## ------------------------------------------------------------------------
pif(data.frame(rlnorm(100)), 0, function(X, thetahat){X}, check_rr = FALSE)

## ------------------------------------------------------------------------
paf(data.frame(runif(100, -1, 1)), 0, rr = function(X, theta){exp(X)}, check_exposure = FALSE)

## ------------------------------------------------------------------------
pif(data.frame(rbeta(100, 2, 3)), 0, rr = function(X, theta){exp(X)}, cft = function(X){2*X}, check_integrals = FALSE)

## ---- error=TRUE---------------------------------------------------------
paf(data.frame(rlnorm(100, 23, 12)), 1, rr = function(X, theta){exp(theta*X)})

## ---- error = TRUE-------------------------------------------------------
pif(as.data.frame(rlnorm(100, 23, 12)), 1, rr = function(X, theta){exp(theta*X)}, cft = function(X){X/2})

## ---- warning=FALSE------------------------------------------------------
paf.confidence(as.data.frame(rlnorm(100, 23, 12)), 1, rr = function(X, theta){exp(theta*X)}, 
               thetavar = 0.2, confidence_method = "inverse", nsim = 50)

## ---- warning=FALSE------------------------------------------------------
paf.confidence(as.data.frame(rlnorm(100, 23, 12)), 1, rr = function(X, theta){exp(theta*X)}, 
               thetavar = 0.2,confidence_method = "linear", nsim = 30)

## ---- error = TRUE-------------------------------------------------------
#Survey weights have different length than exposure
X <- data.frame(runif(100))
w <- rep(1/12, 12)
pif(X, 0.12, rr = function(X, theta){theta*X + 1}, weights = w)

#The Relative Risk function has a different length than exposure X
X  <- data.frame(runif(100))
rr <- function(X, theta){1}
pif(X, 8, rr)

#The counterfactual function result might have a different length than exposure X
X   <- as.data.frame(runif(100))
rr  <- function(X, theta){X + 1}
cft <- function(X){2}
pif(X, 8, rr = rr, cft = cft)


## ---- error = TRUE-------------------------------------------------------
#Extremely large values of rr
pif(as.data.frame(2.61573e+22), 1, rr = function(X, theta){exp(theta*X)}, cft = function(X){X/2},
    Xvar = 100, method = "approximate")

#rr not differentiable at 0
rr <- function(X, theta){
  sqrt(X)
}
paf(as.data.frame(0), 1, rr = rr, method = "approximate", Xvar = 1, check_rr = FALSE)

## ------------------------------------------------------------------------
X  <- rlnorm(100)
rr <- function(X, theta){sqrt(X) + 1}

## ----fig.width=7, fig.height=4, echo = FALSE-----------------------------
densLnorm <- density(X)
dens_data <- data.frame(x = densLnorm$x, y = densLnorm$y)
ggplot(dens_data) + geom_line(aes(x = x, y = y), color = "deepskyblue4", size = 1) + theme_classic() +
  xlab("Exposure X") + ylab("Density") + ggtitle("Gaussian kernel adjusted to exposure data") 

## ---- error = TRUE-------------------------------------------------------
paf(as.data.frame(X), 0.12, rr = rr, method = "kernel", ktype = "gaussian")

## ---- error = TRUE-------------------------------------------------------
#Using empirical method
paf(data.frame(X), 0.12, rr = rr, method = "empirical")

#Rewriting RR function
rr <- function(X, theta){
  Xnew            <- as.data.frame(rep(0, nrow(X)))
  Xnew[which(X[,1] >= 0),1] <- sqrt(X[which(X[,1] >= 0),1] ) + 1
  return(Xnew)
}
paf(data.frame(X), 0.12, rr = rr, method = "kernel", ktype = "gaussian")
pif.kernel(as.data.frame(X), 0.12, rr)


