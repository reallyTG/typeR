## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----simulatedata--------------------------------------------------------
# Number of observations
n <- 1000
# Coefficient for a path (x -> m)
a <- .75
# Coefficient for b path (m -> y)
b <- .80
# Coefficient for total effect (x -> y)
c <- .60
# Coefficient for indirect effect (x -> m -> y)
ab <- a * b
# Coefficient for direct effect (x -> y)
cd <- c - ab
# Compute x, m, y values
set.seed(100)
x <- rnorm(n)
m <- a * x + sqrt(1 - a^2) * rnorm(n)
eps <- 1 - (cd^2 + b^2 + 2*a * cd * b)
y <- cd * x + b * m + eps * rnorm(n)

data <- data.frame(y = y,
                   x = x,
                   m = m)

## ----observed1-----------------------------------------------------------
set.seed(102)
## create 5 y variables, 5 x variables and 5 m variables with jittered data
jitter.data <- lapply(1:5, function (i) {
  apply(data , 2 , function (x) jitter(x , amount=1))
})
# Create data frame with jittered observed variables
jitter.data <- data.frame( sapply(jitter.data, "[" ,,1) , # First column (y)
                           sapply(jitter.data, "[" ,,2) , # Second column (x)
                           sapply(jitter.data, "[" ,,3)   # Third column (m)
)
# Add column names
colnames(jitter.data) <- c( paste0("y",1:5) , paste0("x",1:5) , paste0("m",1:5))

## ----lavaan3-------------------------------------------------------------
model <- '
y =~ y1+y2+y3+y4+y5
x =~ x1+x2+x3+x4+x5
m =~ m1+m2+m3+m4+m5

# direct effect
y ~ c*x
# mediator
m ~ a*x
y ~ b*m
# indirect effect (a*b)
ab := a*b
# total effect
cd := c + (a*b)
'

jitter.fit <- lavaan::sem(model, data = jitter.data)
lavaan::summary(jitter.fit)

## ----fitdata3, eval = FALSE----------------------------------------------
#  bayesian.jitter.fit <- bfw(project.data = jitter.data,
#                             observed = "x1,x2,x3,x4,x5,
#                             m1,m2,m3,m4,m5,
#                             y1,y2,y3,y4,y5",
#                             latent.names = "Independent,Mediator,Dependent",
#                             additional = "indirect <- xm * my , total <- xy + (xm * my)",
#                             additional.names = "AB,C",
#                             jags.model = "fit",
#                             jags.seed = 102,
#                             silent = TRUE)
#  round(bayesian.jitter.fit$summary.MCMC[,3:7],3)
#  #>                                          Mode   ESS   HDIlo   HDIhi    n
#  #> lam[1]: X1                              0.999     0   1.000   1.000 1000
#  #> lam[2]: X2                              1.019  1309   0.966   1.067 1000
#  #> lam[3]: X3                              0.988  1420   0.941   1.042 1000
#  #> lam[4]: X4                              0.998  1440   0.946   1.048 1000
#  #> lam[5]: X5                              0.990  1402   0.932   1.035 1000
#  #> lam[6]: M1                              0.999     0   1.000   1.000 1000
#  #> lam[7]: M2                              0.964  1164   0.912   1.013 1000
#  #> lam[8]: M3                              0.970  1049   0.927   1.026 1000
#  #> lam[9]: M4                              1.013  1075   0.959   1.062 1000
#  #> lam[10]: M5                             0.969  1117   0.921   1.022 1000
#  #> lam[11]: Y1                             0.999     0   1.000   1.000 1000
#  #> lam[12]: Y2                             1.004  1136   0.939   1.059 1000
#  #> lam[13]: Y3                             0.994  1139   0.933   1.050 1000
#  #> lam[14]: Y4                             0.941  1270   0.883   0.999 1000
#  #> lam[15]: Y5                             1.023  1149   0.954   1.074 1000
#  #> error[1]: X1                            0.304  4691   0.273   0.340 1000
#  #> error[2]: X2                            0.321  4464   0.285   0.355 1000
#  #> error[3]: X3                            0.327  4637   0.296   0.366 1000
#  #> error[4]: X4                            0.343  5200   0.305   0.379 1000
#  #> error[5]: X5                            0.346  4795   0.309   0.383 1000
#  #> error[6]: M1                            0.352  5155   0.315   0.388 1000
#  #> error[7]: M2                            0.329  5256   0.296   0.365 1000
#  #> error[8]: M3                            0.319  4979   0.288   0.355 1000
#  #> error[9]: M4                            0.321  4903   0.291   0.358 1000
#  #> error[10]: M5                           0.322  5080   0.288   0.356 1000
#  #> error[11]: Y1                           0.300  4509   0.272   0.337 1000
#  #> error[12]: Y2                           0.333  4645   0.298   0.367 1000
#  #> error[13]: Y3                           0.317  5032   0.288   0.356 1000
#  #> error[14]: Y4                           0.350  5481   0.317   0.388 1000
#  #> error[15]: Y5                           0.329  4929   0.294   0.364 1000
#  #> cov[1,1]: Independent vs. Independent   1.044   884   0.968   1.114 1000
#  #> cov[2,1]: Mediator vs. Independent      0.822   949   0.781   0.872 1000
#  #> cov[3,1]: Dependent vs. Independent     0.609   936   0.574   0.647 1000
#  #> cov[1,2]: Independent vs. Mediator      0.822   949   0.781   0.872 1000
#  #> cov[2,2]: Mediator vs. Mediator         1.071   669   0.994   1.151 1000
#  #> cov[3,2]: Dependent vs. Mediator        0.798   776   0.756   0.848 1000
#  #> cov[1,3]: Independent vs. Dependent     0.609   936   0.574   0.647 1000
#  #> cov[2,3]: Mediator vs. Dependent        0.798   776   0.756   0.848 1000
#  #> cov[3,3]: Dependent vs. Dependent       0.759   683   0.701   0.827 1000
#  #> beta[2,1]: Mediator vs. Independent     0.788  1308   0.735   0.850 1000
#  #> beta[3,1]: Dependent vs. Independent   -0.014  1008  -0.072   0.043 1000
#  #> beta[3,2]: Dependent vs. Mediator       0.760   630   0.696   0.828 1000
#  #> indirect[1]: AB                         0.593   917   0.535   0.662 1000
#  #> total[1]: C                             0.587  1713   0.534   0.640 1000
#  #> Fit (Predicted)                        80.578  5928  69.388  97.268 1000
#  #> Fit (Simulated)                       119.033 10000  92.518 152.408 1000
#  #> Fit (Discrepancy)                     -38.274  9228 -71.546  -5.316 1000
#  #> PPP                                     0.991    20   0.988   0.992 1000

## ----observed2-----------------------------------------------------------
biased.sigma <-matrix(c(1,1,0,1,1,0,0,0,1),3,3)
set.seed(101)
noise <- MASS::mvrnorm(n=2, 
                       mu=c(200, 300, 0), 
                       Sigma=biased.sigma, 
                       empirical=FALSE)
colnames(noise) <- c("y","x","m") 
biased.data <- rbind(data,noise)
jitter.noise <- noise[,rep(1:3,each=5)]
colnames(jitter.noise) <- c( paste0("y",1:5) , paste0("x",1:5) , paste0("m",1:5))
biased.jitter.data <- rbind(jitter.data, jitter.noise)

## ----lavaan4-------------------------------------------------------------
biased.jitter.fit <- lavaan::sem(model, data = biased.jitter.data)
lavaan::summary(biased.jitter.fit)

## ----fitdata4, eval = FALSE----------------------------------------------
#  bayesian.biased.jitter.fit <- bfw(project.data = biased.jitter.data,
#                                    observed = "x1,x2,x3,x4,x5,
#                                    m1,m2,m3,m4,m5,
#                                    y1,y2,y3,y4,y5",
#                                    latent.names = "Independent,Mediator,Dependent",
#                                    additional = "indirect <- xm * my , total <- xy + (xm * my)",
#                                    additional.names = "AB,C",
#                                    jags.model = "fit",
#                                    run.robust = TRUE,
#                                    jags.seed = 103,
#                                    silent = TRUE)
#  round(bayesian.biased.jitter.fit$summary.MCMC[,3:7],3)
#  #>                                        Mode  ESS  HDIlo HDIhi    n
#  #> lam[1]: X1                             0.999    0  1.000 1.000 1002
#  #> lam[2]: X2                             1.011  813  0.961 1.068 1002
#  #> lam[3]: X3                             0.983  846  0.933 1.037 1002
#  #> lam[4]: X4                             0.987  833  0.938 1.048 1002
#  #> lam[5]: X5                             0.973  906  0.925 1.032 1002
#  #> lam[6]: M1                             0.999    0  1.000 1.000 1002
#  #> lam[7]: M2                             0.961  633  0.911 1.014 1002
#  #> lam[8]: M3                             0.977  624  0.925 1.026 1002
#  #> lam[9]: M4                             1.014  588  0.958 1.060 1002
#  #> lam[10]: M5                            0.969  630  0.921 1.022 1002
#  #> lam[11]: Y1                            0.999    0  1.000 1.000 1002
#  #> lam[12]: Y2                            0.998  765  0.940 1.062 1002
#  #> lam[13]: Y3                            1.012  816  0.943 1.068 1002
#  #> lam[14]: Y4                            0.938  936  0.876 0.999 1002
#  #> lam[15]: Y5                            1.023  717  0.962 1.090 1002
#  #> error[1]: X1                           0.223 1986  0.186 0.255 1002
#  #> error[2]: X2                           0.230 2228  0.200 0.275 1002
#  #> error[3]: X3                           0.249 2177  0.214 0.287 1002
#  #> error[4]: X4                           0.263 2074  0.223 0.299 1002
#  #> error[5]: X5                           0.271 2583  0.232 0.308 1002
#  #> error[6]: M1                           0.343 3209  0.309 0.381 1002
#  #> error[7]: M2                           0.324 2957  0.289 0.359 1002
#  #> error[8]: M3                           0.312 2928  0.282 0.352 1002
#  #> error[9]: M4                           0.315 2939  0.283 0.352 1002
#  #> error[10]: M5                          0.319 3258  0.284 0.352 1002
#  #> error[11]: Y1                          0.221 2172  0.192 0.260 1002
#  #> error[12]: Y2                          0.259 2553  0.226 0.297 1002
#  #> error[13]: Y3                          0.248 2543  0.209 0.279 1002
#  #> error[14]: Y4                          0.284 2934  0.247 0.322 1002
#  #> error[15]: Y5                          0.250 2396  0.215 0.288 1002
#  #> cov[1,1]: Independent vs. Independent  1.051  543  0.974 1.126 1002
#  #> cov[2,1]: Mediator vs. Independent     0.825  597  0.782 0.872 1002
#  #> cov[3,1]: Dependent vs. Independent    0.604  603  0.566 0.643 1002
#  #> cov[1,2]: Independent vs. Mediator     0.825  597  0.782 0.872 1002
#  #> cov[2,2]: Mediator vs. Mediator        1.070  377  0.997 1.159 1002
#  #> cov[3,2]: Dependent vs. Mediator       0.797  541  0.746 0.838 1002
#  #> cov[1,3]: Independent vs. Dependent    0.604  603  0.566 0.643 1002
#  #> cov[2,3]: Mediator vs. Dependent       0.797  541  0.746 0.838 1002
#  #> cov[3,3]: Dependent vs. Dependent      0.761  458  0.701 0.832 1002
#  #> beta[2,1]: Mediator vs. Independent    0.787  715  0.732 0.847 1002
#  #> beta[3,1]: Dependent vs. Independent  -0.024  621 -0.080 0.041 1002
#  #> beta[3,2]: Dependent vs. Mediator      0.750  420  0.684 0.825 1002
#  #> indirect[1]: AB                        0.588  604  0.528 0.660 1002
#  #> total[1]: C                            0.572 1358  0.523 0.629 1002

