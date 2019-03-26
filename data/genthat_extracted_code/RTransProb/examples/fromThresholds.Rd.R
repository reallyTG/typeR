library(RTransProb)


### Name: fromThresholds
### Title: Convert credit quality thresholds to probabilities.
### Aliases: fromThresholds

### ** Examples


## Not run: 
##D rc <- c("AAA", "AA", "A", "BBB", "BB", "B", "CCC", "D")
##D t<- matrix(c(Inf,-1.3656,-2.1806,-3.0781,-3.5482,-4.1612,-4.2591,-4.8399,
##D              Inf, 1.5712,-1.5217,-2.3028,-2.6872,-3.5256,-3.7324,-4.1972,
##D              Inf, 2.6895, 1.3806,-1.2901,-2.3422,-2.8928,-3.0063,-3.7861,
##D              Inf, 3.1004, 2.5623, 1.4479,-1.5211,-2.1407,-2.434,	-3.2814,
##D              Inf, 3.4339, 2.6156, 2.4434, 1.4561,-1.4573,-1.9742,-2.4668,
##D              Inf, 2.5852, 2.5586, 2.4218, 2.268,	 1.6737,-1.6194,-2.252,
##D              Inf, 3.6953, 3.6362, 3.3406, 2.5019, 2.2394, 1.6263,-1.3853,
##D              Inf, Inf,	   Inf,	   Inf,	   Inf,	   Inf,	   Inf,	   Inf
##D ), 8,8, dimnames = list(rc,rc), byrow=TRUE)
##D 
##D 
##D transmatrix <- fromThresholds(t)
## End(Not run)




