library(fergm)


### Name: fergm
### Title: Estimation of Frailty Exponential Random Graph Model (FERGM) via
###   MPLE using Stan
### Aliases: fergm
### Keywords: FERGM

### ** Examples

## Not run: 
##D set.seed(1)
##D 
##D data("faux.mesa.high")
##D 
##D mesa <- faux.mesa.high
##D 
##D mesa.fit <- ergm::ergm(mesa ~ edges +
##D                   nodematch('Sex') +
##D                   nodematch('Grade', diff = FALSE) +
##D                   nodematch('Race', diff = FALSE) +
##D                   gwesp(decay = 0.2, fixed = TRUE) +
##D                   altkstar(lambda = 0.6, fixed = TRUE))
##D 
##D library(fergm)
##D form <- c("edges + nodematch('Sex') + nodematch('Grade', diff = FALSE) +
##D           nodematch('Race', diff = FALSE) +
##D           gwesp(decay = 0.2, fixed = TRUE) + altkstar(lambda = 0.6, fixed = TRUE)")
##D 
##D fergm.fit <- fergm(net = mesa, form = form, chains = 2)
## End(Not run)



