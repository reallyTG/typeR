library(survutils)


### Name: get_logrank_res
### Title: Run Log-Rank Test
### Aliases: get_logrank_res

### ** Examples

library("survival")
 
# Get survdiff results
fit <- survfit(Surv(time, status) ~ rx, data = colon)
get_logrank_res(formula(fit), colon)

# Get only log-rank p-value
get_logrank_res(formula(fit), colon, return.p = TRUE)



