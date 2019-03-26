library(cat)


### Name: mi.inference
### Title: Multiple imputation inference
### Aliases: mi.inference
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

oddsr   <- function(x) {                 # Odds ratio of 2 x 2 table.
            o <- (x[1,1]*x[2,2])/
                   (x[1,2]*x[2,1])
            o.sd <- sqrt(1/x[1,1] +      # large sample S.D. (Fienberg,
                      1/x[1,2] +         # p. 18)
                      1/x[2,1] +
                      1/x[2,2])
            return(list(o=o,sd=o.sd))
            }

colns <- colnames(belt.frame)

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
#   Prior hyperparameter is set at 0.5 as in Schafer's p. 329
#
est <- std.error <- vector("list",10)

for (i in 1:10) {
cat("Doing imputation ",i,"\n")
  theta <- dabipf(s,m,theta,prior=0.5,   # toy chain; for comparison with
                   steps=25)             # results in Schafer's book the next
                                         # statement should be run,
                                         # rather than this one.
  ## Not run: theta <- dabipf(s,m,theta,prior=0.5,steps=2500)			   
  imp<- imp.cat(s,theta)
  imp.frame <- cbind(imp$x,imp$counts)
  colnames(imp.frame) <- colns
  a <- xtabs(Freq ~ B2 + I2,             # 2 x 2 table relating belt use
                    data=imp.frame)      # and injury
  print(a)
  odds <- oddsr(a)                       # odds ratio and std.dev.
  est[[i]] <- odds$o - 1                 # check deviations from 1 of
  std.error[[i]] <- odds$sd              # odds ratio
}
odds <- mi.inference(est,std.error)
print(odds)
detach(belt.frame)



