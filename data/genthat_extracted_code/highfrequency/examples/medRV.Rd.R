library(highfrequency)


### Name: medRV
### Title: medRV
### Aliases: medRV
### Keywords: volatility

### ** Examples

 data(sample_tdata);  
 medrv = medRV( rdata = sample_tdata$PRICE, align.by ="minutes", 
            align.period =5, makeReturns=TRUE); 
 medrv 



