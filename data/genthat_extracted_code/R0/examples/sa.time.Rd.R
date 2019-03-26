library(R0)


### Name: sa.time
### Title: Sensitivity analysis of basic reproduction ratio to begin/end
###   dates
### Aliases: sa.time

### ** Examples
## Not run: 
##D #Loading package
##D library(R0)
##D  
##D ## Data is taken from the paper by Nishiura for key transmission parameters of an institutional
##D ## outbreak during 1918 influenza pandemic in Germany)
##D  
##D data(Germany.1918)
##D mGT<-generation.time("gamma", c(2.6,1))
##D sen=sa.time(Germany.1918, mGT, begin=1:15, end=16:30, est.method="EG")
##D  
##D # ...
##D # Warning message:
##D # If 'begin' and 'end' overlap, cases where begin >= end are skipped.
##D # These cases often return Rsquared = 1 and are thus ignored.
##D ## A list with different estimates of reproduction ratio, exponential growth rate and 95%CI 
##D ## wtih different pairs of begin and end dates in form of data frame is returned.
##D ## If method is "EG", results will include growth rate and deviance R-squared measure
##D ## Else, if "ML" method is used, growth rate and R-squared will be set as NA
##D  
##D ## Interesting results include the variation of R0 given specific begin/end dates.
##D ## Such results can be plot as a colored matrix and display Rsquared=f(time period)
##D plot(sen, what=c("criterion","heatmap"))
##D ## Returns complete data.frame of best R0 value for each time period 
##D ## (allows for quick visualization)
##D ## The "best.fit" is the time period over which the estimate is the more robust
##D  
##D # $best.fit
##D #    Time.period Begin.dates  End.dates       R Growth.rate  Rsquared CI.lower CI.upper
##D # 92          15  1970-01-08 1970-01-23 1.64098   0.1478316 0.9752564  1.574953  1.710209
## End(Not run)



