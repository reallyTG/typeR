library(QCA)


### Name: causalChain
### Title: Perform CNA - coincidence analysis using QCA
### Aliases: causalChain
### Keywords: functions

### ** Examples

## Not run: 
##D  
##D # The following examples assume the package cna is installed
##D 
##D library(cna)
##D data(d.educate)
##D cna(d.educate, what = "a")
##D 
##D # same results with
##D cc <- causalChain(d.educate)
##D cc
##D 
##D # inclusion and coverage scores can be inspected for each outcome
##D cc$E$IC
##D 
##D 
##D # another example, function cna() requires specific complexity depths
##D data(d.women)
##D cna(d.women, maxstep = c(3, 4, 9), what = "a")
##D 
##D # same results with, no specific depths are required
##D causalChain(d.women)
##D 
##D 
##D # multivalue data require a different function in package cna
##D data(d.pban)
##D mvcna(d.pban, ordering = list(c("C", "F", "T", "V"), "PB"),
##D       cov = 0.95, maxstep = c(6, 6, 10), what = "a")
##D 
##D # same results again, simpler command
##D causalChain(d.pban, ordering = "C, F, T, V < PB", sol.cov = 0.95)
##D 
##D 
##D # specifying a lower consistency threshold for the solutions
##D mvcna(d.pban, ordering = list(c("C", "F", "T", "V"), "PB"), con = .93,
##D       maxstep = c(6, 6, 10), what = "a")
##D 
##D # same thing with
##D causalChain(d.pban, ordering = "C, F, T, V < PB", pi.cons = 0.93,
##D             sol.cons = 0.95)
##D 
##D 
##D # setting consistency thresholds for the PIs, solutions and also
##D # a coverage threshold for the solution (note that an yet another
##D # function for fuzzy sets is needed in package cna)
##D data(d.autonomy)
##D dat2 <- d.autonomy[15:30, c("AU","RE", "CN", "DE")]
##D fscna(dat2, ordering = list("AU"), con = .9, con.msc = .85, cov = .85,
##D       what = "a")
##D 
##D # again, the same results using the same function:
##D causalChain(dat2, ordering = "AU", sol.cons = 0.9, pi.cons = 0.85,
##D             sol.cov = 0.85)
##D 
## End(Not run)



