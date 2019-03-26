library(Ecdat)


### Name: terrorism
### Title: Global Terrorism Database yearly summaries
### Aliases: terrorism incidents.byCountryYr nkill.byCountryYr
### Keywords: datasets

### ** Examples

data(terrorism)
# plot deaths per million population 

plot(kill.pmp~year, terrorism, 
     pch=method, type='b')
plot(kill.pmp.us~year, terrorism, 
     pch=method, type='b', 
     log='y', las=1)
     
# terrorism as parts per 10,000 
# of all deaths 

plot(pkill*1e4~year, terrorism, 
     pch=method, type='b', 
     las=1)
plot(pkill.us*1e4~year, terrorism, 
     pch=method, type='b', 
     log='y', las=1)
     
# plot number of incidents, number killed, 
# and proportion NA

plot(incidents~year, terrorism, type='b', 
      pch=method)

plot(nkill.us~year, terrorism, type='b', 
      pch=method)
plot(nkill.us~year, terrorism, type='b', 
      pch=method, log='y')

plot(pNA.nkill.us~year, terrorism, type='b', 
      pch=method)
abline(v=1997.5, lty='dotted', col='red')


# by country by year
data(incidents.byCountryYr)
data(nkill.byCountryYr)

yr <- as.integer(colnames(
  incidents.byCountryYr))
str(maxDeaths <- apply(nkill.byCountryYr, 
                       1, max) )
str(omax <- order(maxDeaths, decreasing=TRUE))
head(maxDeaths[omax], 8)
tolower(substring( 
  names(maxDeaths[omax[1:8]]), 1, 2))
pch. <- c('i', 'g', 'f', 'l', 
          's', 'c', 'u', 'p')
cols <- 1:4

matplot(yr, sqrt(t(
  nkill.byCountryYr[omax[1:8], ])),
  type='b', pch=pch., axes=FALSE, 
  ylab='(square root scale)   ', xlab='', 
  col=cols,
  main='number of terrorism deaths\nby country') 
axis(1)
(max.nk <- max(nkill.byCountryYr[omax[1:8], ]))
i.nk <- c(1, 100, 1000, 3000, 
          5000, 7000, 10000)
cbind(i.nk, sqrt(i.nk))
axis(2, sqrt(i.nk), i.nk, las=1)
ip <- paste(pch., names(maxDeaths[omax[1:8]]))
legend('topleft', ip, cex=.55, 
       col=cols, text.col=cols)



