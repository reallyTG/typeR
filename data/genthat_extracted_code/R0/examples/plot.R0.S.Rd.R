library(R0)


### Name: plot.R0.S
### Title: Plot objects from sensitivity.analysis
### Aliases: plot.R0.S

### ** Examples
## Not run: 
##D #Loading package
##D library(R0)
##D 
##D ## Data is taken from the paper by Nishiura for key transmission parameters of an institutional
##D ## outbreak during 1918 influenza pandemic in Germany
##D 
##D data(Germany.1918)
##D mGT<-generation.time("gamma", c(2.6,1))
##D ## sensitivity analysis for begin between day 1 and 15, and end between day 16 and 30
##D sen = sensitivity.analysis(sa.type="time", incid=Germany.1918, GT=mGT, begin=1:15, end=16:30, 
##D                            est.method="EG")
##D # Waiting for profiling to be done...
##D # [...]
##D # Waiting for profiling to be done...
##D # Warning message:
##D # If 'begin' and 'end' overlap, cases where begin >= end are skipped.
##D # These cases often return Rsquared = 1 and are thus ignored. 
##D 
##D 
##D ## Return data.frame which can be plotted. Provides the best Rsquared measures for each 
##D ## time interval, along with a coloured matrix representing R0 values
##D ## Return 2 plots, and also a list with max.Rsquared and best R0 values for each time period
##D plot(sen, what=c("criterion","heatmap"))
##D 
##D # $max.Rsquared
##D # [very big data.frame]
##D # 
##D # $best.fit
##D #     Time.period Begin.dates  End.dates       R Growth.rate  Rsquared CI.lower CI.upper
##D # 122          15  1918-01-07 1918-01-22 1.64098   0.1478316 0.9752564  1.574953  1.710209
## End(Not run)



