library(mondate)


### Name: Combining-methods
### Title: Methods for Combining Mondates
### Aliases: c-methods c,mondate-method cbindmondate rbindmondate
###   rep.mondate
### Keywords: methods

### ** Examples

x <- mondate(1:6) # first 6 month-ends of the year 2000
c(x,x+6)          # all month-ends of 2000
c(0,x)            # result is "numeric", as determined by the first argument

M<-mondate.ymd(2001:2005,12,31) # 5 year-ends
names(M)<-LETTERS[1:5]
cbindmondate(M)                      # as a 5x1 matrix
rbindmondate(M,M)
begin_date <- M-12
cbindmondate(begin_date,end_date=M)  # 5 pairs of year boundary-dates. Columns 
                              # are "automatically" named in the default case 
                              # (all mondates with timeunits="months").
dayt <- as.Date("2010-6-30")
cbindmondate(x,mondate(dayt))        # column names show as 'x' and blank
cbindmondate(x=x,DateColumn=mondate("2010-6-30")) # both columns are named

rep(mondate("2010-2-14"), 3)

(M<-seq(from=mondate("1/1/2010"),length=2)) # Jan. and Feb. 1st
rep(M,3)                                    # three pairs
rep(M,each=3)                               # three Jan.'s, three Feb.'s



