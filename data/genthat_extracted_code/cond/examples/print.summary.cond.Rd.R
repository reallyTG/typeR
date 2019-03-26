library(cond)


### Name: print.summary.cond
### Title: Use print() on a "summary.cond" object
### Aliases: print.summary.cond
### Keywords: methods print

### ** Examples

## Urine Data 
data(urine)
urine.glm <- glm(r ~ gravity + ph + osmo + conduct + urea + calc, 
                 family = binomial, data = urine)
urine.cond <- cond(urine.glm, urea)
print(summary(urine.cond, all = TRUE), digits = 4)
print(summary(urine.cond), Coef = FALSE)



