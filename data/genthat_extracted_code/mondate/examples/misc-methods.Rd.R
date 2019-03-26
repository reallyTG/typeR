library(mondate)


### Name: Miscellaneous-methods
### Title: Miscellaneous Methods for mondate's
### Aliases: mean.mondate pmean pmean-methods pmean,mondate-method
###   unique.mondate quarters.mondate
### Keywords: methods

### ** Examples

(M<-mondate.mdy(12,31,2001:2003))
mean(M)                           # the middle value, Dec. 31, 2002
(M<-c(M,mondate.mdy(12,31,2004))) # tack on another yearend
mean(M)                           # mid-year 2003
mean(M,12)                        # 12 is coerced to Dec. 31, 2000, so the 
                                  # mean is again Dec. 31, 2002

x <- mondate.ymd(2001:2005,12)    # five year ends
y <- x-12                         # one year earlier
pmean(x,y)                        # 2001-06-30 ... 2005-06-30

unique(M,M)                       # just M
(M<-matrix(M,nrow=2))             # now a matrix
rbind(M,M)                        # 2 M's, stacked
unique(rbind(M,M))                # M again, still a matrix

m <- mondate.ymd(2013, 1:12)      # end of the months of 2013
quarters(m)



