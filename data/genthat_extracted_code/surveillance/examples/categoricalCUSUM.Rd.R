library(surveillance)


### Name: categoricalCUSUM
### Title: CUSUM detector for time-varying categorical time series
### Aliases: categoricalCUSUM catcusum.LLRcompute
### Keywords: regression

### ** Examples

if (require("gamlss")) {
  ###########################################################################
  #Beta-binomial CUSUM for a small example containing the time-varying
  #number of positive test out of a time-varying number of total
  #test.
  #######################################

  #Load meat inspection data
  data("abattoir")

  #Use GAMLSS to fit beta-bin regression model
  phase1 <- 1:(2*52)
  phase2  <- (max(phase1)+1) : nrow(abattoir)

  #Fit beta-binomial model using GAMLSS
  abattoir.df <- as.data.frame(abattoir)

  #Replace the observed and epoch column names to something more convenient
  dict <- c("observed"="y", "epoch"="t", "population"="n")
  replace <- dict[colnames(abattoir.df)]
  colnames(abattoir.df)[!is.na(replace)] <- replace[!is.na(replace)]

  m.bbin <- gamlss( cbind(y,n-y) ~ 1 + t +
                      + sin(2*pi/52*t) + cos(2*pi/52*t) +
                      + sin(4*pi/52*t) + cos(4*pi/52*t), sigma.formula=~1,
                   family=BB(sigma.link="log"),
                   data=abattoir.df[phase1,c("n","y","t")])

  #CUSUM parameters
  R <- 2 #detect a doubling of the odds for a test being positive
  h <- 4 #threshold of the cusum

  #Compute in-control and out of control mean
  pi0 <- predict(m.bbin,newdata=abattoir.df[phase2,c("n","y","t")],type="response")
  pi1 <- plogis(qlogis(pi0)+log(R))
  #Create matrix with in control and out of control proportions.
  #Categories are D=1 and D=0, where the latter is the reference category
  pi0m <- rbind(pi0, 1-pi0)
  pi1m <- rbind(pi1, 1-pi1)


  ######################################################################
  # Use the multinomial surveillance function. To this end it is necessary
  # to create a new abattoir object containing counts and proportion for
  # each of the k=2 categories. For binomial data this appears a bit
  # redundant, but generalizes easier to k>2 categories.
  ######################################################################

  abattoir2 <- sts(epoch=1:nrow(abattoir), start=c(2006,1), freq=52,
    observed=cbind(abattoir@observed, abattoir@populationFrac-abattoir@observed),
    populationFrac=cbind(abattoir@populationFrac,abattoir@populationFrac),
    state=matrix(0,nrow=nrow(abattoir),ncol=2),
    multinomialTS=TRUE)

  ######################################################################
  #Function to use as dfun in the categoricalCUSUM
  #(just a wrapper to the dBB function). Note that from v 3.0-1 the
  #first argument of dBB changed its name from "y" to "x"!
  ######################################################################
  mydBB.cusum <- function(y, mu, sigma, size, log = FALSE) {
    return(dBB(y[1,], mu = mu[1,], sigma = sigma, bd = size, log = log))
  }


  #Create control object for multinom cusum and use the categoricalCUSUM
  #method
  control <- list(range=phase2,h=h,pi0=pi0m, pi1=pi1m, ret="cases",
		   dfun=mydBB.cusum)
  surv <- categoricalCUSUM(abattoir2, control=control,
			   sigma=exp(m.bbin$sigma.coef))

  #Show results
  plot(surv[,1],dx.upperbound=0)
  lines(pi0,col="green")
  lines(pi1,col="red")

  #Index of the alarm
  which.max(alarms(surv[,1]))
}



