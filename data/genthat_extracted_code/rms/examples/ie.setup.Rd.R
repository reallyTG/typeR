library(rms)


### Name: ie.setup
### Title: Intervening Event Setup
### Aliases: ie.setup
### Keywords: survival

### ** Examples

failure.time <- c(1 ,   2,   3)
event        <- c(1 ,   1,   0)
ie.time      <- c(NA, 1.5, 2.5)

z <- ie.setup(failure.time, event, ie.time)
S <- z$S
S
ie.status <- z$ie.status
ie.status
z$subs
z$reps
## Not run: 
##D attach(input.data.frame[z$subs,])   #replicates all variables
##D f <- cph(S ~ age + sex + ie.status)
##D # Instead of duplicating rows of data frame, could do this:
##D attach(input.data.frame)
##D z <- ie.setup(failure.time, event, ie.time)
##D s <- z$subs
##D age <- age[s]
##D sex <- sex[s]
##D f <- cph(S ~ age + sex + ie.status)
## End(Not run)



