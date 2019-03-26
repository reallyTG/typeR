library(MRHawkes)


### Name: mllMRH
### Title: Minus loglikelihood of an (bivariate) MRHawkes model
### Aliases: mllMRH
### Keywords: MRHawkes likelihood MLE

### ** Examples

  ## Magnitude 5.5 or greater earthquakes over the 25 year period from 
  ## 01/01/1991 to 31/12/2015.
  data(fivaqks); 
  near.fiji <- grep("Fiji", fivaqks$place)
  near.vanuatu <- grep("Vanuatu", fivaqks$place)
  t.beg <- strptime("1991-01-01 00:00:00", "%Y-%m-%d %H:%M:%S", tz = "UTC")
  t.end <- strptime("2015-12-31 23:59:59", "%Y-%m-%d %H:%M:%S", tz = "UTC")
  t0 <- 0
  t1 <- as.numeric(t.end - t.beg)
  tms <- strptime(fivaqks$time, "%Y-%m-%dT%H:%M:%OSZ", tz = "UTC")
  ts <- as.numeric(tms[-1] - t.beg)
  ts <- c(as.numeric(tms[1] - t.beg)/24, ts)
  ts.fi <- ts[near.fiji]; ts.fi <- ts.fi[ts.fi >= 0 & ts.fi <= t1]
  ts.va <- ts[near.vanuatu]; ts.va <- ts.va[ts.va >=0 & ts.va <= t1]
  ts.c <- c(ts.fi, ts.va)
  z.c <- c(rep(1, times = length(ts.fi)), rep(2, times = length(ts.va)))
  o <- order(ts.c)
  data <- cbind(ts.c[o], z.c[o])
  ## No test: 
  ## calculate the minus loglikelihood of an (bivariate) MRHawkes with some 
  ## parameters the default hazard functions and density functions are Weibull 
  ## and exponential respectivley
  mllMRH(data, cens = t1, par = c(0.488, 20.10, 0.347, 9.53, 461, 720,
                                  0.472, 0.293, 0.399, -0.0774))
                                  
  ## calculate the MLE for the parameter assuming known parametric forms
  ## of the immigrant hazard function and offspring density functions.  
  
    system.time(est <- optim(c(0.488, 20.10, 0.347, 9.53, 461, 720,
                                  0.472, 0.293, 0.399, -0.0774), 
                             mllMRH, data = data, cens = t1,
                             control = list(maxit = 5000, trace = TRUE),
                             hessian = TRUE)
    )
    ## point estimate by MLE
    est$par
    ## standard error estimates:
    diag(solve(est$hessian))^0.5
  
## End(No test)



