library(Ecfun)


### Name: countsByYear
### Title: Allocate totals by year
### Aliases: countsByYear
### Keywords: manip

### ** Examples

##
## 1.  data.frame(WarName, Start1, End1, BatDeath)
##
start73 <- as.Date('1973-01-22')
tstWars <- data.frame(WarName=c('short', '2yr', '10yr'), 
    Start1=c(start73, start73+365, start73-365), 
    End1=start73+c(99, 2*365, NA), 
    BatDeath=c(100, 123, 456)) 
##
## 2.  do
##
deathsByYr <- countsByYear(tstWars, 
              endNA=start73+9*365.2)

# check 
Counts <- matrix(0, 11, 3, 
    dimnames=list(c(1972:1982), tstWars$WarName) )
Counts['1973', 1] <- 100
Counts[as.character(1974:1975), 2] <- with(tstWars, 
    countByYear(Start1[2], End1[2], BatDeath[2]) )
Counts[as.character(1972:1982), 3] <- with(tstWars, 
    countByYear(Start1[3], start73+9*365.2, BatDeath[3]) )

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(deathsByYr, Counts)
## Don't show: 
)
## End(Don't show)
  



