## ---- echo=FALSE, out.width='60%', fig.cap="Thrombolytic treatment network, from Phillippo et al. (2018)."----
knitr::include_graphics("Thrombo_network.png")

## ------------------------------------------------------------------------
library(nmathresh)

# library(coda)   # Not required - but prints the summary in a nicer format
# Thrombo.post.summary

## ------------------------------------------------------------------------
dat.raww <- read.delim(system.file("extdata", "Thrombo_data.txt", package = "nmathresh"))

# print first few rows
head(dat.raww)

n <- nrow(dat.raww)   # number of studies

## ------------------------------------------------------------------------
# Log OR for two-arm trials, arm 2 vs. 1
dat.raww$lor.1 <- with(dat.raww, log(r.2 * (n.1 - r.1) / ((n.2 - r.2) * r.1)) )

dat.raww$k.1 <- dat.raww$t.2   # Arm 2 treatment
dat.raww$b.1 <- dat.raww$t.1   # Reference treatment


# Log OR for three-arm trials, arm 3 vs. 1
dat.raww$lor.2 <- with(dat.raww, log(r.3 * (n.1 - r.1) / ((n.3 - r.3) * r.1)) )

dat.raww$k.2 <- dat.raww$t.3   # Arm 3 treatment (NA if only 2 arms)
dat.raww$b.2 <- ifelse(is.na(dat.raww$k.2), NA, dat.raww$t.1)   # Reference treatment

## ------------------------------------------------------------------------
# LOR variances and covariances, likelihood covariance matrix V
V.diag <- as.list(rep(NA, n))
attach(dat.raww)
for (i in 1:n){
  if (dat.raww$n_arms[i] == 2){
    V.diag[[i]] <- 1/r.1[i] + 1/r.2[i] + 1/(n.1[i]-r.1[i]) + 1/(n.2[i]-r.2[i])
  }
  else if (dat.raww$n_arms[i] == 3){
    v1 <- 1/r.1[i] + 1/r.2[i] + 1/(n.1[i]-r.1[i]) + 1/(n.2[i]-r.2[i])
    v2 <- 1/r.1[i] + 1/r.3[i] + 1/(n.1[i]-r.1[i]) + 1/(n.3[i]-r.3[i])
    # Covariance term
    c1 <- 1/r.1[i] + 1/(n.1[i] - r.1[i])
    V.diag[[i]] <- matrix(c(v1, c1, c1, v2), nrow = 2)
  }
}
detach(dat.raww)

library(Matrix)
V <- bdiag(V.diag)

## ------------------------------------------------------------------------
# Reshape the data to have one row per contrast per study
dat.rawl <- reshape(dat.raww, varying = c("lor.1", "b.1", "k.1", "lor.2", "b.2", "k.2"), 
                    timevar = "c", idvar = "studyID", direction = "long")

# Sort data by study and contrast, removing NA rows
dat.rawl <- dat.rawl[order(dat.rawl$studyID, dat.rawl$c, dat.rawl$b, na.last = NA), ]

N <- nrow(dat.rawl)   # number of data points
K <- length(unique(c(dat.rawl$b, dat.rawl$k)))   # Number of treatments

## ------------------------------------------------------------------------
# Construct the design matrix, with a row for each contrast and K-1 columns (parameters)
X <- matrix(0, nrow = N, ncol = K-1)

for (i in 1:N){
  X[i, dat.rawl$k[i]-1] <- 1
  if (dat.rawl$b[i] != 1){
    X[i, dat.rawl$b[i]-1] <- -1
  }
}

## ------------------------------------------------------------------------
# Now we can perform thresholding at the study level
thresh <- nma_thresh(mean.dk = Thrombo.post.summary$statistics[1:(K-1), "Mean"], 
                     lhood = V, 
                     post = Thrombo.post.cov, 
                     nmatype = "fixed",
                     X = X,
                     opt.max = FALSE)

## ------------------------------------------------------------------------
thresh

## ---- fig.width=13, fig.height=5.5, out.width='100%', dpi=300------------
# Display using a forest plot, along with 95% confidence intervals for LORs
# Create row labels
dat.rawl$lab <- rep(NA, nrow(dat.rawl))
for (i in 1:nrow(dat.rawl)) {
  dat.rawl$lab[i] <- paste0(dat.rawl$studyID[i], " (", dat.rawl$k[i], " vs. ", dat.rawl$b[i], ")")
}

# Calculate 95% CIs
dat.rawl$CI2.5 <- dat.rawl$lor + qnorm(.025)*sqrt(diag(V))
dat.rawl$CI97.5 <- dat.rawl$lor + qnorm(.975)*sqrt(diag(V))

# Calculate the proportion of CI covered by invariant interval, for sorting.
# Coverage <1 means that the CI extends beyond the bias invariant threshold, and 
# the threshold is below the level of statistical uncertainty.
dat.rawl$coverage <- apply(cbind(thresh$thresholds$lo / (dat.rawl$CI2.5 - dat.rawl$lor), 
                             thresh$thresholds$hi / (dat.rawl$CI97.5 - dat.rawl$lor)), 
                         1, min, na.rm = TRUE)


# Plot
thresh_forest(thresh, 
              y = lor, CI.lo = CI2.5, CI.hi = CI97.5, 
              label = lab, orderby = coverage, data = dat.rawl,
              CI.title = "95% Confidence Interval", y.title = "Log OR", 
              label.title = "Study (Contrast)", xlab = "Log Odds Ratio", 
              xlim = c(-3, 2), refline = 0, digits = 2,
              calcdim = FALSE)

## ---- fig.width=6, fig.height=6, out.width='60%', dpi=300----------------
thresh_2d(thresh, 1, 2,
          xlab = "Adjustment in Study 1 LOR: 3 vs. 1",
          ylab = "Adjustment in Study 1 LOR: 4 vs. 1",
          xlim = c(-1.5, 0.5), ylim = c(-2, 14),
          ybreaks = seq(-2, 14, 2))

## ---- include=FALSE------------------------------------------------------
# Reset environment
rm(list = ls())

## ------------------------------------------------------------------------
K <- 6   # Number of treatments

# Contrast design matrix is
X <- matrix(ncol = K-1, byrow = TRUE,
            c(1, 0, 0, 0, 0,
              0, 1, 0, 0, 0,
              0, 0, 1, 0, 0,
              0, 0, 0, 1, 0,
              0, -1, 1, 0, 0,
              0, -1, 0, 1, 0,
              0, -1, 0, 0, 1))

# Reconstruct using NNLS
lik.cov <- recon_vcov(Thrombo.post.cov, prior.prec = .0001, X = X)

## ------------------------------------------------------------------------
thresh <- nma_thresh(mean.dk = Thrombo.post.summary$statistics[1:(K-1), "Mean"], 
                     lhood = lik.cov, 
                     post = Thrombo.post.cov, 
                     nmatype = "fixed", 
                     X = X, 
                     opt.max = FALSE)

## ---- fig.width = 12, fig.height = 3.5, out.width = '100%', dpi = 300----
# Get treatment codes for the contrasts with data
d.a <- d.b <- vector(length = nrow(X))
for (i in 1:nrow(X)){
  d.a[i] <- ifelse(any(X[i, ] == -1), which(X[i, ] == -1), 0) + 1
  d.b[i] <- ifelse(any(X[i, ] == 1), which(X[i, ] == 1), 0) + 1
}

# Transform from d_ab style contrast references into d[i] style from the full set of contrasts
# for easy indexing in R
d.i <- d_ab2i(d.a, d.b, K = 6)

# Create plot data
plotdat <- data.frame(lab = paste0(d.b, " vs. ", d.a),
                      contr.mean = Thrombo.post.summary$statistics[d.i, "Mean"],
                      CI2.5 = Thrombo.post.summary$quantiles[d.i, "2.5%"],
                      CI97.5 = Thrombo.post.summary$quantiles[d.i, "97.5%"])

# Plot
thresh_forest(thresh, contr.mean, CI2.5, CI97.5, label = lab, data = plotdat,
              label.title = "Contrast", xlab = "Log Odds Ratio", CI.title = "95% Credible Interval",
              xlim = c(-.3, .3), refline = 0, digits = 2, calcdim = FALSE)

## ---- include=FALSE------------------------------------------------------
# Reset environment
rm(list=ls())

## ---- echo=FALSE, out.width='60%', fig.cap="Social anxiety treatment network, from Phillippo et al. (2018)."----
knitr::include_graphics("Social_Anxiety_network.png")

## ---- eval=FALSE---------------------------------------------------------
#  library(nmathresh)
#  library(Matrix)
#  
#  # library(coda)   # Not required - but prints the summary in a nicer format
#  # SocAnx.post.summary

## ------------------------------------------------------------------------
# Read study data
dat.raww <- read.delim(system.file("extdata", "SocAnx_data.txt", package = "nmathresh"))

# Print first few rows
head(dat.raww)

n <- nrow(dat.raww)   # Number of studies

# Turn wide study data into long with one row for each arm
dat.rawl <- reshape(dat.raww, varying=c("t.2","y.2","Var.2","t.3","y.3","Var.3",
                                        "t.4","y.4","Var.4","t.5","y.5","Var.5"),
                    timevar="arm", idvar="studyID", direction="long")

# Sort data by study and contrast, removing NA rows
dat.rawl <- dat.rawl[order(dat.rawl$studyID, dat.rawl$arm, dat.rawl$y, na.last=NA),]

K <- length(unique(c(dat.rawl$t.1, dat.rawl$t)))    # Number of treatments
N <- nrow(dat.rawl)    # Number of data points

## ------------------------------------------------------------------------
# Get indices of d, sd, diff in the CODA data
vnames <- sub("(.*)\\[.*","\\1", rownames(SocAnx.post.summary$statistics))
ind.d <- which(vnames=="d")
ind.sd <- which(vnames=="sd")
ind.diff <- which(vnames=="diff")
ind.delta <- which(vnames=="delta")

## ------------------------------------------------------------------------
# Create likelihood covariance matrix
V.diag <- as.list(rep(NA,n))
attach(dat.raww)
for (i in 1:n){
  if (n.arms[i] == 2){
    V.diag[[i]] <- Var.2[i]
  }
  else {
    V.diag[[i]] <- matrix(V[i], nrow=n.arms[i]-1, ncol=n.arms[i]-1)
    tempVar <- c(Var.2[i], Var.3[i], Var.4[i], Var.5[i])
    diag(V.diag[[i]]) <- tempVar[!is.na(tempVar)]
  }
}
detach(dat.raww)

lik.cov <- bdiag(V.diag)

## ------------------------------------------------------------------------
thresh <- nma_thresh(mean.dk = SocAnx.post.summary$statistics[ind.d, "Mean"], 
                     lhood = lik.cov, 
                     post = SocAnx.post.cov,
                     nmatype = "random", 
                     opt.max = FALSE)

## ---- fig.width=14, fig.height=9.5, out.width='100%', dpi=300------------
# 95% CIs
dat.rawl$CI2.5 <- with(dat.rawl, y + qnorm(0.025)*sqrt(Var))
dat.rawl$CI97.5 <- with(dat.rawl, y + qnorm(0.975)*sqrt(Var))

# Study labels
dat.rawl$lab <- with(dat.rawl, paste0(studyID," (",t," vs ",t.1,")"))

# Forest plot - all contrasts, very large
# thresh_forest(thresh, y, CI2.5, CI97.5, label = lab, data = dat.rawl,
#               label.title = "Study (Contrast)", xlab = "Standardised Mean Difference", 
#               xlim = c(-4, 3), y.title = "SMD", refline = 0, digits = 2)

# Forest plot - only contrasts with thresholds <2 SMD
cutoff <- 2
absmin <- function(x) min(abs(x))
dat.rawl$coverage <- apply(thresh$thresholds[, c("lo", "hi")] / 
                             (dat.rawl[, c("CI2.5", "CI97.5")] - dat.rawl$y), 
                           1, absmin)
dat.rawl$ord <- ifelse(thresh$thresholds$lo > -cutoff | thresh$thresholds$hi < cutoff, 
                       dat.rawl$coverage, NA)

thresh_forest(thresh, y, CI2.5, CI97.5, label = lab, 
              orderby = list(ord, na.last = NA), data = dat.rawl,
              label.title = "Study (Contrast)", xlab = "Standardised Mean Difference", 
              xlim = c(-4, 3), y.title = "SMD", refline = 0, digits = 2, calcdim = FALSE)

## ---- include = FALSE----------------------------------------------------
# Reset environment
rm(list=ls())

## ------------------------------------------------------------------------
trt.dat <- read.delim(system.file("extdata", "SocAnx_data.txt", package = "nmathresh"))[, 1:6]

head(trt.dat)   # Print first few rows

K <- with(trt.dat, length(unique(c(t.1, t.2, t.3, t.4, t.5)))) -1  # Number of treatments , -1 for NA

# work out which contrasts have data
contr.ab <- data.frame(a = c(), b = c())

for (i in 1:nrow(trt.dat)) {
   rowi <- trt.dat[i, which(!is.na(trt.dat[i, 2:6]))+1] # non NA elements of ith row
   
   # get contrast from all combinations of treatments
   trtcomb <- combn(rowi, 2, function(x) sapply(x, as.numeric))
   
   a <- apply(trtcomb, 2, min)
   b <- apply(trtcomb, 2, max)
   
   # remove contrasts of treatments against themselves
   iseq <- a == b
   a <- a[!iseq]
   b <- b[!iseq]
   
   if (!all(iseq)) contr.ab <- rbind(contr.ab, cbind(a, b))
}

contr.ab <- unique(contr.ab[order(contr.ab$a, contr.ab$b), ])


# Contrast design matrix
X <- matrix(0, nrow = nrow(contr.ab), ncol = K-1)
for (i in 1:nrow(X)) {
  if (contr.ab[i, "a"] > 1) X[i, contr.ab[i, "a"] - 1]  <- -1
  if (contr.ab[i, "b"] > 1)   X[i, contr.ab[i, "b"] - 1]    <- 1
}

## ------------------------------------------------------------------------
# Get indices of d, sd, diff in the CODA data
vnames <- sub("(.*)\\[.*","\\1", rownames(SocAnx.post.summary$statistics))
ind.d <- which(vnames=="d")
ind.sd <- which(vnames=="sd")
ind.diff <- which(vnames=="diff")
ind.delta <- which(vnames=="delta")

## ------------------------------------------------------------------------
# Class model is used, so use the prior mean precision from the gamma distribution
prior.prec <- rep(3.9/0.35, 40)
# Other than for treatment 3
prior.prec[2] <- 0.0001

lik.cov <- recon_vcov(SocAnx.post.cov[1:(K-1), 1:(K-1)], prior.vcov = diag(1/prior.prec), X = X)

## ------------------------------------------------------------------------
thresh <- nma_thresh(mean.dk = SocAnx.post.summary$statistics[ind.d, "Mean"], 
                     lhood = lik.cov,
                     post = SocAnx.post.cov[1:(K-1), 1:(K-1)],
                     nmatype = "fixed", 
                     X = X, 
                     opt.max = FALSE)

## ---- fig.width=13, fig.height=11, out.width='100%', dpi=300-------------
# Get indices of contrasts in likelihood
d.a <- d.b <- vector(length = nrow(X))
for (i in 1:nrow(X)) {
  d.a[i] <- ifelse(any(X[i, ] == -1), which(X[i, ] == -1), 0) + 1
  d.b[i] <- ifelse(any(X[i, ] == 1), which(X[i, ] == 1), 0) + 1
}

d.i <- d_ab2i(d.a, d.b, K = K)

# Contrast labels and credible intervals (from the posterior summary)
plotdat <- data.frame(
  contr = paste0(d.b, " vs. ", d.a),
  contr.mean = SocAnx.post.summary$statistics[ind.diff[d.i], "Mean"],
  CI2.5 = SocAnx.post.summary$quantiles[ind.diff[d.i], "2.5%"],
  CI97.5 = SocAnx.post.summary$quantiles[ind.diff[d.i], "97.5%"]
)

cutoff <- 2
absmin <- function(x) min(abs(x))
plotdat$ord <- ifelse(thresh$thresholds$lo > -cutoff | thresh$thresholds$hi < cutoff,
                      apply(thresh$thresholds[, c("lo", "hi")], 1, absmin), NA)

thresh_forest(thresh, contr.mean, CI2.5, CI97.5, 
              label = contr, orderby = list(ord, na.last = NA), data = plotdat,
              label.title = "Contrast", xlab = "SMD", xlim = c(-4, 3), 
              CI.title = "95% Credible Interval",
              refline = 0, digits = 2, calcdim = FALSE)

## ------------------------------------------------------------------------
# Drug treatments (+ combi therapies)
drugtrts <- c(9:23, 37:41)

# Which data points compare these to an inactive trt?
drugdats <- which(contr.ab$a %in% 1:3 & contr.ab$b %in% drugtrts)

# Get U solutions by summing the indivual solutions of drug data points
U.drugs <- 1 / (rowSums(1 / thresh$Ukstar[,drugdats]))

# Which contrasts do the rows of Ukstar correspond to?
Ukstar.ab <- d_i2ab(1:(K*(K-1)/2), K)
Ukstar.ab <- Ukstar.ab[Ukstar.ab$a == thresh$kstar | Ukstar.ab$b == thresh$kstar, ]

## ------------------------------------------------------------------------
# Thresholds are then
thresh.drugs <- get.int(U.drugs, thresh$kstar, 1:K, Ukstar.ab)

## ---- fig.height=6, fig.width=8, out.width='80%', dpi=300----------------
## Function to plot the common invariant interval with the data
plotII <- function(thresh, contr.mean, CrI.lo, CrI.hi, rowlabs, xlim, xlab, ylab, ...){
  
  yaxs <- length(contr.mean):1
  
  # split plot in two
  layout(matrix(1:2,nrow=1), widths=c(.2,1))
  
  # plot row labels on left side
  gp <- par(mar=c(5,4,1,0))
  plot(rep(0,length(yaxs)), yaxs, pch=NA, ylim=c(.5,yaxs[1]+.5), ylab="",
       xlab="", yaxt="n", xaxt="n", bty="n")
  text(0, yaxs, labels=rowlabs,xpd=NA)
  title(ylab=ylab, line=2)
  
  # fake plot for setup of right side
  par(mar=c(5,1,1,2))
  plot(contr.mean, yaxs, pch=NA, yaxt="n", xlim=xlim,
       ylim=c(.5,yaxs[1]+.5), ylab="", xlab="",...)
  title(xlab=xlab, line=2)
  
  # reference line
  abline(v=0, lty=2, col="gray")
  
  # combined invariant region
  polygon(rep(c(contr.mean + thresh$lo, rev(contr.mean) + thresh$hi), each=2), 
          c(rep(yaxs,each=2) + c(.5,-.5), rep(rev(yaxs),each=2) + c(-.5,.5)),
          col=rgb(.7,.8,.9,.7),
          border=rgb(.6,.7,.8))
  
  # credible intervals
  segments(y0=yaxs, x0=CrI.lo, x1=CrI.hi, lend=1)
  
  # contrast means
  points(contr.mean, yaxs, pch=21, col="black", bg="white")
  
  # write new optimal treatments at either side
  text(xlim[1], round(length(yaxs)/2), 
       labels=as.expression(substitute(tilde(k)*"* = "*xx,list(xx=thresh$lo.newkstar))), 
       pos=4)
  text(xlim[2], round(length(yaxs)/2),
       labels=as.expression(substitute(tilde(k)*"* = "*xx,list(xx=thresh$hi.newkstar))),
       pos=2)
  
  # write invariant interval below plot
  with(thresh, title(xlab=paste0("Invariant interval about zero: ",lo.newkstar,
                                 " (",formatC(lo,digits=2,format="f"),", ",
                                 formatC(hi,digits=2,format="f"),") ",
                                 hi.newkstar), line=3))
  
  par(gp)
}


plotII(thresh.drugs, 
       SocAnx.post.summary$statistics[ind.diff[drugdats], "Mean"], 
       SocAnx.post.summary$quantiles[ind.diff[drugdats], "2.5%"],
       SocAnx.post.summary$quantiles[ind.diff[drugdats], "97.5%"],
       rowlabs = paste0(contr.ab[drugdats, "b"], " vs. ", contr.ab[drugdats, "a"]),
       xlim = c(-4, 1.5), ylab = "Drug vs. Inactive Contrasts", xlab = "SMD")

## ---- fig.width=8, fig.height=5.5, out.width='80%', dpi=300--------------
# Psych treatments
psychtrts <- c(4:8, 24:36)

# Which data points compare these to an inactive trt?
psychdats <- which(contr.ab$a %in% 1:3 & contr.ab$b %in% psychtrts)

# Get U solutions by summing the influences of drug data points
U.psych <- 1 / (rowSums(1 / thresh$Ukstar[,psychdats]))

# Thresholds are then
thresh.psych <- get.int(U.psych, thresh$kstar, 1:K, Ukstar.ab)

plotII(thresh.psych, 
       SocAnx.post.summary$statistics[ind.diff[psychdats], "Mean"], 
       SocAnx.post.summary$quantiles[ind.diff[psychdats], "2.5%"],
       SocAnx.post.summary$quantiles[ind.diff[psychdats], "97.5%"],
       rowlabs=paste0(contr.ab[psychdats,"b"]," vs. ",contr.ab[psychdats,"a"]),
       xlim=c(-3,2), ylab="Psych vs. Inactive Contrasts", xlab="SMD")

## ---- fig.width=8, fig.height=8, out.width='80%', dpi=300----------------
thresh.drugpsych <- list(
  Ukstar = cbind(U.drugs, U.psych),
  kstar = thresh$kstar
)

thresh_2d(thresh.drugpsych, 1, 2,
          xlab = "SMD adjustment: Drug vs. Inactive",
          ylab = "SMD adjustment: Psych vs. Inactive",
          xlim = c(-6, 2), ylim = c(-6, 2),
          breaks = -6:2)

## ---- eval=FALSE---------------------------------------------------------
#  # Use coda package to read in the CODA files generated by WinBUGS
#  # The CODA files need only contain the dd parameter (contrasts).
#  library(coda)
#  dat.CODA <- mcmc.list(lapply(c("Coda1.txt",
#                                 "Coda2.txt",
#                                 "Coda3.txt"),
#                        read.coda, index.file = "CodaIndex.txt"))
#  
#  
#  # Posterior summary table
#  Thrombo.post.summary <- summary(dat.CODA)
#  
#  # Posterior covariance matrix of basic treatment effects d_k = d_1k
#  Thrombo.post.cov <- cov(as.matrix(dat.CODA[,1:5]))

## ---- eval=FALSE---------------------------------------------------------
#  # Use coda package to read in the CODA files generated by WinBUGS
#  # The CODA files need only contain the d, delta, and sd parameters.
#  library(coda)
#  dat.CODA <- mcmc.list(lapply(c("Coda1.txt",
#                                 "Coda2.txt"),
#                               read.coda, index.file = "CodaIndex.txt"))
#  
#  # Get indices of parameters
#  vnames <- sub("(.*)\\[.*","\\1", varnames(dat.CODA))
#  ind.d <- which(vnames=="d")
#  ind.diff <- which(vnames=="diff")
#  ind.delta <- which(vnames=="delta")
#  ind.sd <- which(vnames=="sd")
#  
#  # Posterior summary table
#  SocAnx.post.summary <- summary(dat.CODA)
#  
#  # Posterior covariance matrix of d and delta parameters
#  SocAnx.post.cov <- cov(as.matrix(dat.CODA[,c(ind.d, ind.delta)]))

