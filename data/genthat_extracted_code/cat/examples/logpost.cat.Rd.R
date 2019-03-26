library(cat)


### Name: logpost.cat
### Title: Log-posterior density for incomplete categorical data
### Aliases: logpost.cat
### Keywords: models

### ** Examples

data(older)                            # load data
older[1:2,c(1:4,7)]                    # see partial content; older.frame also
                                       # available.
s <- prelim.cat(older[,1:4],older[,7]) # preliminary manipulations
m <- c(1,2,0,3,4)                      # margins for restricted model
thetahat1 <- ecm.cat(s,margins=m)      # mle 
logpost.cat(s,thetahat1)               # loglikelihood at thetahat1



