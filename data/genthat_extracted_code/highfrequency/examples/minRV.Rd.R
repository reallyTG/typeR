library(highfrequency)


### Name: minRV
### Title: minRV
### Aliases: minRV
### Keywords: volatility

### ** Examples

 data(sample_tdata); 
 
 minrv = minRV( rdata = sample_tdata$PRICE, align.by ="minutes", 
            align.period =5, makeReturns=TRUE); 
 minrv 



