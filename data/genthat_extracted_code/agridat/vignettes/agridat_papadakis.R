## ----setup, message=FALSE, echo=FALSE---------------------------------------------------
knitr::opts_chunk$set(fig.width=6, fig.height=6)
options(width=90)

## ----func-------------------------------------------------------------------------------
papcov <- function(resid,x,y){

  # Make sure x and y are numeric
  if(is.factor(x)) x <- as.numeric(as.character(x))
  if(is.factor(y)) y <- as.numeric(as.character(y))
  xy <- paste(x,y,sep=":")

  # Average neighboring residuals in up/down direction
  xym1 <- paste(x,y-1,sep=":")
  xyp1 <- paste(x,y+1,sep=":")
  rm1 <- resid[match(xym1,xy,NA)]
  rp1 <- resid[match(xyp1,xy,NA)]
  ud <- (rm1+rp1)/2
  # If only one neighboring residual is available, then just use it
  ud <- ifelse(is.na(ud) & !is.na(rm1),rm1,ud)
  ud <- ifelse(is.na(ud) & !is.na(rp1),rp1,ud)

  # Average neighboring residuals in left/right direction
  xm1y <- paste(x-1,y,sep=":")
  xp1y <- paste(x+1,y,sep=":")
  cm1 <- resid[match(xm1y,xy,NA)]
  cp1 <- resid[match(xp1y,xy,NA)]
  lr <- (cm1+cp1)/2
  # If only one neighboring residual is available, then just use it
  lr <- ifelse(is.na(lr) & !is.na(cm1),cm1,lr)
  lr <- ifelse(is.na(lr) & !is.na(cp1),cp1,lr)

  return(list(LR=lr, UD=ud))
}

## ----hinz-------------------------------------------------------------------------------
library("agridat")
data(federer.tobacco)
dat <- federer.tobacco
dat <- transform(dat, height=height-600) # For simplicity

# Model 1 - RCB
m1 <- aov(height ~ factor(block) + factor(dose), dat)
anova(m1)

# Model 2 - Row/Col as class variables
m2 <- aov(height ~ factor(block) + factor(dose) + factor(row), dat)
anova(m2)

# Model 3 - Two-step Papadakis
m3 <- aov(height ~ factor(dose), dat)
dat <- cbind(dat, papcov(m3$resid, dat$block, dat$row))
m4 <- aov(height ~ factor(dose) + LR + UD, data=dat)
anova(m4)
# Resid MS uses 1 df less to account for covariates.  Matches Hinz.
582073 / 46 

## ----stroup-----------------------------------------------------------------------------
library("agridat")
data(stroup.nin)
dat2 <- stroup.nin
dat2 <- subset(dat2,!is.na(yield))
n.gen <- nlevels(dat2$gen)

# RCB model, ranks match Stroup Table 2, RCB Alliance
m5 <-  lm(yield ~ gen -1 + rep, data=dat2)
pred.rcb <- coef(m5)[1:n.gen] # RCB adj means
rev(57-sort(rank(pred.rcb)))

# Initial genotype model (no blocks)
m6 <-  lm(yield ~ gen -1, data=dat2)
# Calculate Papadakis covariates
pp <- papcov(resid(m6), dat2$col, dat2$row)
dat2$LR <- pp$LR
dat2$UD <- pp$UD
# Single iteration of Papadakis model
m7 <- lm(yield ~ gen - 1 + LR + UD, data=dat2)
# Papadakis adjusted means
adjmn <- coef(m7)[1:n.gen]
# Residual = observed - adjusted mean
resid <- dat2$yield - adjmn[match(paste0("gen",dat2$gen),names(adjmn))]

# Now iterate Papadakis method to convergence
iter <- 0
notConv <- TRUE
while(notConv){
  iter <- iter + 1
  # Covariates based on residuals
  pp <- papcov(resid, dat2$col, dat2$row)
  dat2$LR <- pp$LR
  dat2$UD <- pp$UD
  m8 <- lm(yield ~ gen - 1 + LR + UD, data=dat2)
  # Check convergence of adjusted means
  prevmn <- adjmn
  adjmn <- coef(m8)[1:n.gen]
  tol <- sum((adjmn - prevmn)^2)
  cat("Iteration: ",iter," tol: ",tol,"\n")
  notConv <- tol > .001
  resid <- dat2$yield - adjmn[match(paste0("gen",dat2$gen),names(adjmn))]
}
pred.pap <- adjmn

# Ranks almost match Stroup et al, Table 2, Alliance, RCB+NNA-PAP
all <- data.frame(rcb=57-rank(pred.rcb), nna=57-rank(pred.pap))
all[order(all$rcb),]

# Visually compare the coefficients from the two methods
lims=range(c(pred.rcb,pred.pap))
plot(pred.rcb, pred.pap, xlim=lims, ylim=lims,
     xlab="RCB",ylab="Papadakis",type='n')
text(pred.rcb,pred.pap, substring(names(pred.rcb),4),cex=0.5)
title("Iterated Papadakis vs. RCB")
abline(0,1)

