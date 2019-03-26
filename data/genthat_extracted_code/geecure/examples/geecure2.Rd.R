library(geecure)


### Name: geecure2
### Title: Semiparametric marginal proportional hazards mixture cure model
### Aliases: geecure2

### ** Examples

## Don't show: 
# for checks
           data(bmt)
           testdata <- bmt[(1:dim(bmt)[1])[bmt$Z9 == 2 | bmt$Z9 == 3], ] 
           geecuretest2 <- geecure2(Surv(T2, d3) ~ Z8, cureform = ~ Z8, data = testdata, 
           id = testdata$Z9, corstr= "independence")
## End(Don't show)
## No test: 
# Example. Fit the marginal semiparametric PHMC model for the bmt data.
data(bmt)
geebmtind2 <- geecure2(Surv(T2, d3) ~ Z8, cureform = ~ Z8, data = bmt, id = bmt$Z9, 
              corstr= "independence")           
geebmtexch2 <- geecure2(Surv(T2, d3) ~ Z8, cureform = ~ Z8, data = bmt, id = bmt$Z9, 
               corstr= "exchangeable", stdz = TRUE, Var = FALSE)
## End(No test)



