library(genomic.autocorr)


### Name: acf.summary
### Title: acf.summary
### Aliases: acf.summary

### ** Examples

## simulate data with 10 repeated observations in a row - ie there
## should be autocorrelation only within windows <= 10
library(data.table)
data <- genomic.autocorr:::.sim.data() 
summ <- acf.summary(data,c("x","y0","y1"),lag.max=20)

## plot it
df <- melt(summ,c("lag","variable"),variable.name="acf")
par(mfrow=c(2,1))
matplot(matrix(df[acf=="full",]$value,ncol=3),
        main="full",
        pch=c("x","o","+"),
        type="b")
abline(h=0,lty=2)
legend("bottomright",
       c("x","y0","y1"),
       pch = "xo+", col = 1:3)
matplot(matrix(df[acf=="partial",]$value,ncol=3),
        main="partial",
        pch=c("x","o","+"),
        type="b")
abline(h=0,lty=2)
legend("bottomright",
       c("x","y0","y1"),
       pch = "xo+", col = 1:3)



