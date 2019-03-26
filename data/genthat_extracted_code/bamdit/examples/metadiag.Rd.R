library(bamdit)


### Name: metadiag
### Title: Bayesian Meta-Analysis of diagnostic test data
### Aliases: metadiag

### ** Examples



## Not run: 
##D 
##D # Example: data from Glas et al. (2003).....................................
##D library(bamdit)
##D data("glas")
##D glas.t <- glas[glas$marker == "Telomerase", 1:4]
##D 
##D glas.t <- glas[glas$marker == "Telomerase", 1:4]
##D 
##D # Simple visualization ...
##D 
##D plotdata(glas.t,                # Data frame
##D          two.by.two = FALSE     # Data is given as: (tp, n1, fp, n2)
##D          )
##D 
##D glas.m1 <- metadiag(glas.t,                # Data frame
##D                     two.by.two = FALSE,    # Data is given as: (tp, n1, fp, n2)
##D                     re = "normal",         # Random effects distribution
##D                     re.model = "DS",       # Random effects on D and S
##D                     link = "logit",        # Link function
##D                     sd.Fisher.rho   = 1.7, # Prior standard deviation of correlation
##D                     nr.burnin = 1000,      # Iterations for burnin
##D                     nr.iterations = 10000, # Total iterations
##D                     nr.chains = 2,         # Number of chains
##D                     r2jags = TRUE)         # Use r2jags as interface to jags
##D 
##D 
##D  summary(glas.m1, digit=3)
##D 
##D  plot(glas.m1,                    # Fitted model
##D       level = c(0.5, 0.75, 0.95), # Credibility levels
##D       parametric.smooth = TRUE)   # Parametric curve
##D 
##D 
##D # Plot results: based on a non-parametric smoother of the posterior predictive rates .......
##D 
##D plot(glas.m1,                    # Fitted model
##D      level = c(0.5, 0.75, 0.95), # Credibility levels
##D      parametric.smooth = FALSE)  # Non-parametric curve
##D 
##D 
##D # Using the pipe command in the package dplyr ...............................................
##D 
##D library(dplyr)
##D 
##D glas.t %>%
##D   metadiag(re = "normal", re.model ="SeSp") %>%
##D   plot(parametric.smooth = FALSE, color.pred.points = "red")
##D 
##D 
##D 
##D # Visualization of posteriors of hyper-parameters .........................................
##D library(ggplot2)
##D library(GGally)
##D library(R2jags)
##D attach.jags(glas.m1)
##D hyper.post <- data.frame(mu.D, mu.S, sigma.D, sigma.S, rho)
##D ggpairs(hyper.post,                  # Data frame
##D        title = "Hyper-Posteriors",          # title of the graph
##D        lower = list(continuous = "density") # contour plots
##D        )
##D 
##D 
##D #............................................................................
##D 
##D # List of different statistical models:
##D #    1) Different link functions: logit, cloglog and probit
##D 
##D #    2) Different parametrization of random effects in the link scale:
##D #         DS = "differences of TPR and FPR"
##D #         SeSp = "Sensitivity and Specificity"
##D 
##D #    3) Different random effects distributions:
##D #       "normal" or "sm = scale mixtures".
##D 
##D #    4) For the scale mixture random effects:
##D #       split.w = TRUE => "split the weights".
##D 
##D #    5) For the scale mixture random effects:
##D #       df.estimate = TRUE => "estimate the degrees of freedom".
##D 
##D #    6) For the scale mixture random effects:
##D #       df.estimate = TRUE => "estimate the degrees of freedom".
##D 
##D #    7) For the scale mixture random effects:
##D #       df = 4 => "fix the degrees of freedom to a particual value".
##D #       Note that df = 1 fits a Cauchy bivariate distribution to the random effects.
##D 
##D # logit-normal-DS
##D m <- metadiag(glas.t, re = "normal", re.model = "DS", link = "logit")
##D summary(m)
##D plot(m)
##D 
##D # cloglog-normal-DS
##D summary(metadiag(glas.t, re = "normal", re.model = "DS", link = "cloglog"))
##D 
##D # probit-normal-DS
##D summary(metadiag(glas.t, re = "normal", re.model = "DS", link = "probit"))
##D # logit-normal-SeSp
##D summary(metadiag(glas.t, re = "normal", re.model = "SeSp", link = "logit"))
##D 
##D # cloglog-normal-SeSp
##D summary(metadiag(glas.t, re = "normal", re.model = "SeSp", link = "cloglog"))
##D # probit-normal-SeSp
##D summary(metadiag(glas.t, re = "normal", re.model = "SeSp", link = "probit"))
##D 
##D # logit-sm-DS
##D summary(metadiag(glas.t, re = "sm", re.model = "DS", link = "logit", df = 1))
##D 
##D # cloglog-sm-DS
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "DS", link = "cloglog", df = 1))
##D plot(m, parametric.smooth = FALSE)
##D 
##D # probit-sm-DS
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "DS", link = "probit", df = 1))
##D plot(m, parametric.smooth = FALSE)
##D 
##D # logit-sm-SeSp
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "logit", df = 1))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D 
##D # cloglog-sm-SeSp
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "cloglog", df = 1))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D 
##D # probit-sm-SeSp
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "probit", df = 1))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D 
##D # logit-sm-DS-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "DS", link = "logit",
##D  df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D 
##D # cloglog-sm-DS-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "DS", link = "cloglog",
##D df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D 
##D # probit-sm-DS-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "DS", link = "probit",
##D df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D 
##D # logit-sm-SeSp-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "probit",
##D df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D 
##D # cloglog-sm-SeSp-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "cloglog",
##D df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D 
##D # probit-sm-SeSp-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "probit",
##D df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D 
##D # split.w ...................................................................
##D 
##D # logit-sm-DS
##D summary(m <- metadiag(glas.t, re = "sm", re.model = "DS", link = "logit", split.w = TRUE, df = 10))
##D plot(m)
##D 
##D # cloglog-sm-DS
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "DS", link = "cloglog", split.w = TRUE, df = 4))
##D plot(m)
##D 
##D # probit-sm-DS
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "DS", link = "probit", split.w = TRUE, df = 4))
##D plot(m, parametric.smooth = FALSE)
##D 
##D # logit-sm-SeSp
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "logit", split.w = TRUE, df = 1))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D plotw(m)
##D 
##D # cloglog-sm-SeSp
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "cloglog", split.w = TRUE, df = 1))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D plotw(m)
##D 
##D # probit-sm-SeSp
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "probit", split.w = TRUE, df = 1))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D plotw(m)
##D 
##D 
##D # logit-sm-DS-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "DS", link = "logit", split.w = TRUE,
##D  df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D plotw(m)
##D 
##D # cloglog-sm-DS-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "DS", link = "cloglog", split.w = TRUE,
##D df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D plotw(m)
##D 
##D # probit-sm-DS-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "DS", link = "probit", split.w = TRUE,
##D df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D plotw(m)
##D 
##D # logit-sm-SeSp-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "probit", split.w = TRUE,
##D df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D plotw(m)
##D 
##D # cloglog-sm-SeSp-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "cloglog", split.w = TRUE,
##D df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D plotw(m)
##D 
##D # probit-sm-SeSp-df
##D summary(m<-metadiag(glas.t, re = "sm", re.model = "SeSp", link = "probit", split.w = TRUE,
##D df.estimate = TRUE))
##D plot(m, parametric.smooth = FALSE, level = c(0.5, 0.9))
##D plotw(m)
##D 
## End(Not run)




