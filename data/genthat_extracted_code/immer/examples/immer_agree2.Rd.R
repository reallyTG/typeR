library(immer)


### Name: immer_agree2
### Title: Agreement Statistics for 2 Raters
### Aliases: immer_agree2 summary.immer_agree2

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset in Schuster & Smith (2006)
#############################################################################

data(data.immer08)
dat <- data.immer08

y <- dat[,1:2]
w <- dat[,3]
# agreement statistics
res <- immer::immer_agree2( y=y, w=w )
summary(res)
# extract some output values
res$agree_stats
res$agree_raw



