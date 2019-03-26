library(distrMod)


### Name: ParamFamily
### Title: Generating function for ParamFamily-class
### Aliases: ParamFamily
### Keywords: distribution models

### ** Examples


## "default" (normal location)
F1 <- ParamFamily(modifyParam = function(theta){ Norm(mean = theta) })
plot(F1)

################################
## Some examples:
################################
## 1. Normal location family
theta <- 0
names(theta) <- "mean"
NL <- ParamFamily(name = "Normal location family",
          param = ParamFamParameter(name = "location parameter", main = theta),
          distribution = Norm(mean = 0, sd = 1), ## sd known!
          startPar = function(x,...) c(min(x),max(x)),
          distrSymm <- SphericalSymmetry(SymmCenter = 0),
          modifyParam = function(theta){ Norm(mean = theta, sd = 1) },
          props = paste(c("The normal location family is invariant under",
                    "the group of transformations 'g(x) = x + mean'",
                    "with location parameter 'mean'"), collapse = " "))
NL

## 2. Normal scale family
theta <- 1
names(theta) <- "sd"
NS <- ParamFamily(name = "Normal scale family",
          param = ParamFamParameter(name = "scale parameter", main = theta,
          .returnClsName = "ParamWithScaleFamParameter"),
          distribution = Norm(mean = 0, sd = 1), ## mean known!
          startPar = function(x,...) c(0,-min(x)+max(x)),
          distrSymm <- SphericalSymmetry(SymmCenter = 0),
          modifyParam = function(theta){ Norm(mean = 0, sd = theta) },
          props = paste(c("The normal scale family is invariant under",
                    "the group of transformations 'g(y) = sd*y'",
                    "with scale parameter 'sd'"), collapse = " "))
NS

## 3. Normal location and scale family
theta <- c(0, 1)
names(theta) <- c("mean", "sd")
NLS <- ParamFamily(name = "Normal location and scale family",
          param = ParamFamParameter(name = "location and scale parameter",
                                    main = theta,
                                 .returnClsName = "ParamWithScaleFamParameter"),
          distribution = Norm(mean = 0, sd = 1),
          startPar = function(x,...) c(median(x),mad(x)),
          makeOKPar = function(param) {param[2]<-abs(param[2]); return(param)},
          distrSymm <- SphericalSymmetry(SymmCenter = 0),
          modifyParam = function(theta){
                            Norm(mean = theta[1], sd = theta[2])
                        },
          props = paste(c("The normal location and scale family is",
                    "invariant under the group of transformations",
                    "'g(x) = sd*x + mean' with location parameter",
                    "'mean' and scale parameter 'sd'"),
                    collapse = " "))
NLS

## 4. Binomial family
theta <- 0.3
names(theta) <- "prob"
B <- ParamFamily(name = "Binomial family",
         param = ParamFamParameter(name = "probability of success", 
                                   main = theta),
         startPar = function(x,...) c(0,1),
         distribution = Binom(size = 15, prob = 0.3), ## size known!
         modifyParam = function(theta){ Binom(size = 15, prob = theta) },
         props = paste(c("The Binomial family is symmetric with respect",
                   "to prob = 0.5; i.e.,",
                   "d(Binom(size, prob))(k)=d(Binom(size,1-prob))(size-k)"),
                   collapse = " "))
B

## 5. Poisson family
theta <- 7
names(theta) <- "lambda"
P <- ParamFamily(name = "Poisson family",
          param = ParamFamParameter(name = "positive mean", main = theta),
          startPar = function(x,...) c(0,max(x)),
          distribution = Pois(lambda = 7),
          modifyParam = function(theta){ Pois(lambda = theta) })
P


## 6. Exponential scale family
theta <- 2
names(theta) <- "scale"
ES <- ParamFamily(name = "Exponential scale family",
          param = ParamFamParameter(name = "scale parameter", main = theta,
                           .returnClsName = "ParamWithScaleFamParameter"),
          startPar = function(x,...) c(0,max(x)-min(x)),
          distribution = Exp(rate = 1/2),
          modifyParam = function(theta){ Exp(rate = 1/theta) },
          props = paste(c("The Exponential scale family is invariant under",
                    "the group of transformations 'g(y) = scale*y'",
                    "with scale parameter 'scale = 1/rate'"),
                    collapse = " " ))
ES

## 7. Lognormal scale family
theta <- 2
names(theta) <- "scale"
LS <- ParamFamily(name = "Lognormal scale family",
          param = ParamFamParameter(name = "scale parameter", main = theta,
                           .returnClsName = "ParamWithScaleFamParameter"),
          startPar = function(x,...) c(0,max(x)-min(x)),
          distribution = Lnorm(meanlog = log(2), sdlog = 2),## sdlog known!
          modifyParam = function(theta){ 
                            Lnorm(meanlog = log(theta), sdlog = 2) 
                        },
          props = paste(c("The Lognormal scale family is invariant under",
                    "the group of transformations 'g(y) = scale*y'",
                    "with scale parameter 'scale = exp(meanlog)'"),
                    collapse = " "))
LS

## 8. Gamma family
theta <- c(1, 2)
names(theta) <- c("scale", "shape")
G <- ParamFamily(name = "Gamma family",
        param = ParamFamParameter(name = "scale and shape", main = theta,
                           withPosRestr = TRUE,
                           .returnClsName = "ParamWithScaleAndShapeFamParameter"),
        startPar = function(x,...) {E <- mean(x); V <- var(X); c(V/E,E^2/V)},
        makeOKPar = function(param) abs(param),
        distribution = Gammad(scale = 1, shape = 2),
        modifyParam = function(theta){ 
                          Gammad(scale = theta[1], shape = theta[2]) 
                      },
        props = paste(c("The Gamma family is scale invariant via the",
                  "parametrization '(nu,shape)=(log(scale),shape)'"),
                  collapse = " "))
G



