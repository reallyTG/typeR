library(secrdesign)


### Name: validate
### Title: Reject Implausible Statistics
### Aliases: validate
### Keywords: manip

### ** Examples


## Not run: 
##D 
##D ## generate some data
##D scen1 <- make.scenarios(D = c(5,10), sigma = 25, g0 = 0.2)
##D traps1 <- make.grid()
##D tmp1 <- run.scenarios(nrepl = 5, trapset = traps1, scenarios = scen1,
##D     fit = TRUE, extractfn = trim)
##D tmp2 <- predict(tmp1)
##D tmp3 <- select.stats(tmp2, 'D', c('estimate','RB','RSE','COV'))
##D 
##D ## just for demonstration --
##D ## apply scenario-specific +/- 20% bounds for estimated density
##D ## set RB, RSE and COV to NA when estimate is outside this range
##D permitted <- outer(tmp3$scenarios$D, c(0.8,1.2)) 
##D permitted   ## a 2 x 2 matrix
##D tmp4 <- validate(tmp3, 'estimate', permitted, c('RB', 'RSE','COV'))
##D 
##D ## what have we done?!
##D tmp4$output
##D summary(tmp4)
##D 
## End(Not run)



