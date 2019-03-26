library(immer)


### Name: immer_reshape_wideformat
### Title: Creating a Rating Dataset in Wide Format
### Aliases: immer_reshape_wideformat
### Keywords: Utility function

### ** Examples

#############################################################################
# EXAMPLE 1: Reshaping ratings of one variable into wide format
#############################################################################

data(data.immer03)
dat <- data.immer03

# select variable "b" and persons which have at least 10 ratings
dfr <- immer::immer_reshape_wideformat( y=dat$b2, pid=dat$idstud, rater=dat$rater,
                    Nmin_ratings=10 )
head(dfr)

#############################################################################
# EXAMPLE 2: Reshaping ratings of a data frame into wide format
#############################################################################

data(data.immer07)
dat <- data.immer07

#*** Dataset 1: Wide format for item I1
dfr1 <- immer::immer_reshape_wideformat( dat$I1, rater=dat$rater, pid=dat$pid)

#*** Dataset 2: Wide format for four items I1, I2, I3 and I4
dfr2 <- immer::immer_reshape_wideformat( dat[, paste0("I",1:4) ],
              rater=dat$rater, pid=dat$pid )
str(dfr2)



