library(optband)


### Name: func.sum
### Title: Aggregate 'survfit' object strata
### Aliases: func.sum
### Keywords: internal

### ** Examples

library(survival)
res <- summary(survfit(Surv(stop, event) ~ rx, data=bladder))
cols <- lapply(c(2:11) , function(x) res[x])
tbl <- do.call(data.frame, cols)
category = unique(tbl$strata)
temptbl1 = tbl[tbl$strata == category[1],]; temptbl1$n = res$n[1]
temptbl2 = tbl[tbl$strata == category[2],]; temptbl2$n = res$n[2]
sigma1_2 = cumhaz.var(temptbl1)
sigma2_2 = cumhaz.var(temptbl2)
func.sum(c(0, sigma1_2)/temptbl1$n[1], c(0, sigma2_2)/temptbl2$n[2],
  c(0, temptbl1$time), c(0, temptbl2$time))




