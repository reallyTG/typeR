# Example from
# [R-sig-ME] Struggle with glmer().
# Sun, 16 Jul 2017 21:57:07 +1200
# Rolf Turner <r.turner@auckland.ac.nz>
#  r-sig-mixed-models@r-project.org <r-sig-mixed-models@r-project.org>

# see also http://bbolker.github.io/mixedmodels-misc/notes/cloglogsim.html

if (spaMM.getOption("example_maxtime")>14) {
  if (requireNamespace("MASS", quietly = TRUE)) {
    artSim <- function(){
      #
      # Function to simulate "artificial" data which is at least superficially
      # similar to some real data.
      #
      
      
      link    <- "cloglog"
      B       <- binomial(link=link)
      linkfun <- B$linkfun
      linkinv <- B$linkinv
      
      # Construct (artificial) treatment factor, covariate, and
      # (random) replicate factor.
      x    <- seq(0,28,by=2)
      Trt  <- LETTERS[1:24]
      Rep  <- 1:3 # Three reps per treatment.
      Xdat <- expand.grid(x=x,Trt=Trt,Rep=Rep)
      uRep <- with(Xdat,factor(paste0(Rep,Trt)))
      Xdat$Rep <- with(Xdat,factor(as.numeric(uRep)))
      
      beta0 <- seq(-3,0.45,by=0.15)
      beta1 <- rep(seq(0.05,0.3,by=0.05),4)
      names(beta0) <- Trt
      names(beta1) <- Trt
      Sigma <- matrix(c(0.06,-0.001,-0.001,0.0001),nrow=2)
      
      lb0   <- beta0[match(Xdat$Trt,names(beta0))]
      lb1   <- beta1[match(Xdat$Trt,names(beta1))]
      nrep  <- 72
      imat  <- match(Xdat$Rep,1:nrep)
      Z     <- MASS::mvrnorm(nrep,c(0,0),Sigma)[imat,]
      linpr <- lb0 + Z[,1] + (lb1 + Z[,2])*Xdat$x
      p     <- linkinv(linpr)
      nsize <- 25
      Dead  <- rbinom(nrow(Xdat),nsize,p)
      Alive <- nsize - Dead
      x0    <- (linkfun(0.99) - beta0)/beta1
      Xdat$Dead  <- Dead
      Xdat$Alive <- Alive
      attr(Xdat,"trueLD99") <- x0
      return(Xdat)
    }
    
    set.seed(42)
    X <- artSim()
    fit1 <- HLfit(cbind(Dead,Alive) ~ (Trt + 0)/x + (x | Rep),
                  family=binomial(link="cloglog"),
                  data=X,HLmethod="ML",verbose=c(TRACE=FALSE)) ## 
    testthat::expect_equal(logLik(fit1)[[1]],-1413.207,tolerance=1e-4) ## This is works in spprec too, with version 2.5.33
    if (FALSE) { ## not useful in routine tests
      if (file.exists((privtest <- "C:/home/francois/travail/stats/spaMMplus/spaMM/package/tests_other_pack/test-cloglog-lme4-glmmTMB.R"))) {
        source(privtest)
      }
    }
  } else cat("test cloglog random slope: increase example_maxtime (14.8s) to run this test.\n")  
}
