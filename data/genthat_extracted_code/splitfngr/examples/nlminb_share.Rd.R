library(splitfngr)


### Name: nlminb_share
### Title: Use splitfngr with nlminb
### Aliases: nlminb_share

### ** Examples

quad_share <- function(x){list(sum(x^4), 4*x^3)}
nlminb_share(start=c(3, -5), fngr=quad_share)

## Not run: 
##D # Add a sleep amount to show when it can be faster
##D 
##D # Using share
##D quad_fngr <- function(x){Sys.sleep(.01); list(sum(x^4), 4*x^3)}
##D system.time(nlminb_share(start=c(3, -5), fngr=quad_fngr))
##D 
##D # Without share
##D quad_fn <- function(x) {Sys.sleep(.01); sum(x^4)}
##D quad_gr <- function(x) {Sys.sleep(.01); 4*x^3}
##D system.time(nlminb(c(3,-5), quad_fn, quad_gr))
## End(Not run)



