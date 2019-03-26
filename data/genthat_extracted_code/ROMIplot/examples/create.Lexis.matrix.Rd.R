library(ROMIplot)


### Name: create.Lexis.matrix
### Title: Creates a Lexis surface matrix.
### Aliases: create.Lexis.matrix
### Keywords: Lexis surface

### ** Examples


theyears <- 1900:2012
theages <- 0:110
n <- length(theyears) * length(theages)

# 'Simulating' a data frame in the HMD format
HMD.formatted.data <- data.frame(Year=sort(rep(theyears, length(theages))),
                                 Age = rep(theages, length(theyears)),
                                 Female = runif(n=n),
                                 Male = runif(n=n),
                                 Total = runif(n=n))

a.Lexis.matrix <- create.Lexis.matrix(HMD.dataset=HMD.formatted.data,
                                      Sex="Total", minage=30, maxage=105,
                                      minyear=1905, maxyear=2010)



