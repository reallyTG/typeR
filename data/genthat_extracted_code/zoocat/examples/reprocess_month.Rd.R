library(zoocat)


### Name: reprocess_month
### Title: Reprocess month of 'zoomly' objects
### Aliases: reprocess_month

### ** Examples

mat <- matrix(1:48, ncol = 12)
ctable <- data.frame(month = rep(1 : 12))
zm <- zoomly(mat, order.by = 1991 : 1994, colattr = ctable)
reprocess_month(zm, mon.repro = -11:2)
reprocess_month(zm, mon.repro = -24:3)



