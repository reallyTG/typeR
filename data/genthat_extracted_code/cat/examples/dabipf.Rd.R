library(cat)


### Name: dabipf
### Title: Data augmentation-Bayesian IPF algorithm for incomplete
###   categorical data
### Aliases: dabipf
### Keywords: models

### ** Examples

#
#  Example 1   Based on Schafer's p. 329 and ss. This is a toy version,
#              using a much shorter length of chain than required. To 
#              generate results comparable with those in the book, edit
#              the \dontrun{ } line below and comment the previous one.
#
data(belt)
attach(belt.frame)
EB <- ifelse(B1==B2,1,0)
EI <- ifelse(I1==I2,1,0)
belt.frame <- cbind(belt.frame,EB,EI)
colnames(belt.frame)
a <- xtabs(Freq ~ D + S + B2 + I2 + EB + EI,
                data=belt.frame)
m <- list(c(1,2,3,4),c(3,4,5,6),c(1,5),
           c(1,6),c(2,6))
b <- loglin(a,margin=m)                  # fits (DSB2I2)B2I2EBEI)(DEB)(DEI)(SEI)
                                         # in Schafer's p. 304

a <- xtabs(Freq ~ D + S + B2 + I2 + B1 + I1,
                data=belt.frame)
m <- list(c(1,2,5,6),c(1,2,3,4),c(3,4,5,6),
           c(1,3,5),c(1,4,6),c(2,4,6))
b <- loglin(a,margin=m)                  # fits (DSB1I1)(DSB2I2)(B2I2B1I1)(DB1B2)
                                         #  (DI1I2)(SI1I2) in Schafer's p. 329
s <- prelim.cat(x=belt[,-7],counts=belt[,7])
m <- c(1,2,5,6,0,1,2,3,4,0,3,4,5,6,0,1,3,5,0,1,4,6,0,2,4,6)
theta <- ecm.cat(s,margins=m,            # excruciantingly slow; needs 2558
                   maxits=5000)          # iterations.
rngseed(1234)
#
#   Now ten multiple imputations of the missing variables B2, I2 are
#   generated, by running a chain and taking every 2500th observation.
#   Prior hyperparameter is set at 0.5 as in Shchafer's p. 329
#
imputations <- vector("list",10)

for (i in 1:10) {
cat("Doing imputation ",i,"\n")
  theta <- dabipf(s,m,theta,prior=0.5,   # toy chain; for comparison with
                   steps=25)             # results in Schafer's book the next
                                         # statement should be run,
                                         # rather than this one.
  ## Not run: theta <- dabipf(s,m,theta,prior=0.5,steps=2500)			   
  imputations[[i]] <- imp.cat(s,theta)
}
  

		   
detach(belt.frame)
#
#  Example 2   (reproduces analysis performed in Schafer's p. 327.)
#
#  Caveat! I try to reproduce what has been done in that page, but although
#  the general appearance of the boxplots generated below is quite similar to
#  that of  Schafer's Fig. 8.4 (p. 327), the VALUES of the log odds do not
#  quite fall in line with those reported by said author. It doesn't look like
#  the difference can be traced to decimal vs. natural logs. On the other hand,
#  Fig. 8.4 refers to log odds, while the text near the end of page 327 gives
#  1.74 and 1.50 as the means of the *odds* (not log odds). FT, 22.7.2003.
#
#
data(older)                              # reading data
x      <- older[,1:6]                    # preliminary manipulations
counts <- older[,7]
s <- prelim.cat(x,counts)                
colnames(x)                              # names of columns
rngseed(1234)
m <- c(1,2,3,4,5,0,1,2,3,5,6,0,4,3)      # model (ASPMG)(ASPMD)(GD) in
                                         # Schafer's p. 327
                                         # do analysis with different priors
theta   <- ecm.cat(s,m,prior=1.5)        # Strong pull to uniform table
                                         # for initial estimates
prob1   <- dabipf(s,m,theta,steps=100,   # Burn-in period 
                  prior=0.1)
prob2   <- dabipf(s,m,theta,steps=100,   # Id. with second prior
                  prior=1.5)

lodds   <- matrix(0,5000,2)              # Where to store log odds ratios.

oddsr   <- function(x) {                 # Odds ratio of 2 x 2 table.
            o <- (x[1,1]*x[2,2])/
                   (x[1,2]*x[2,1])
            return(o)
            }

for(i in 1:5000) {                       # Now generate 5000 log odds
prob1  <- dabipf(s,m,prob1, prior=0.1)   
t1   <- apply(prob1,c(1,2),sum)          # Marginal GD table
                                         # Log odds ratio
lodds[i,1] <- log(oddsr(t1))
prob2  <- dabipf(s,m,prob2, prior=1.5)   # Id. with second prior
t2   <- apply(prob2,c(1,2),sum)         
lodds[i,2] <- log(oddsr(t2))
}
lodds  <- as.data.frame(lodds)
colnames(lodds) <- c("0.1","1.5")        # Similar to Schafer's Fig. 8.4.
boxplot(lodds,xlab="Prior hyperparameter")
title(main="Log odds ratio generated with DABIPF (5000 draws)")
summary(lodds)




