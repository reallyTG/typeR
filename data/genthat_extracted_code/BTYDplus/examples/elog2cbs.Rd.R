library(BTYDplus)


### Name: elog2cbs
### Title: Convert Event Log to customer-level summary statistic
### Aliases: elog2cbs

### ** Examples

data("groceryElog")
cbs <- elog2cbs(groceryElog, T.cal = "2006-12-31", T.tot = "2007-12-30")
head(cbs)



