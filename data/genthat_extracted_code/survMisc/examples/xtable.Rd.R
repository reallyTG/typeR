library(survMisc)


### Name: xtable
### Title: 'xtable' methods
### Aliases: xtable xtable.table xtable.survfit

### ** Examples

data("kidney", package="KMsurv")
xtable(with(kidney, table(delta, type)))

## K&M. Example 7.2, pg 210.
xtable(survfit(Surv(time=time, event=delta) ~ type, data=kidney))





