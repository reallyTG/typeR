library(reporttools)


### Name: displayCoxPH
### Title: Function to display a coxph() object
### Aliases: displayCoxPH
### Keywords: manip character

### ** Examples

## Not run: 
##D # use example from coxph() in library 'survival'
##D test1 <- list(time = c(4, 3, 1, 1, 2, 2, 3),  
##D               status = c(1, 1, 1, 0, 1, 1, 0),  
##D               x = c(0, 2, 1, 1, 1, 0, 0),  
##D               sex = c(0, 0, 0, 0, 1, 1, 1)) 
##D 
##D # fit a coxph() model
##D mod1 <- coxph(Surv(time, status) ~ x + sex, data = test1) 
##D 
##D # generate table to insert in Sweave file
##D m1 <- displayCoxPH(mod1)
## End(Not run)



