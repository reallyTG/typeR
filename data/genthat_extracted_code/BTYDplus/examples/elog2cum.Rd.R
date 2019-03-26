library(BTYDplus)


### Name: elog2cum
### Title: Convert Event Log to Transaction Counts
### Aliases: elog2cum elog2inc

### ** Examples

data("groceryElog")
cum <- elog2cum(groceryElog)
plot(cum, typ="l", frame = FALSE)
inc <- elog2inc(groceryElog)
plot(inc, typ="l", frame = FALSE)



