library(Epi)


### Name: gen.exp
### Title: Generate covariates for drug-exposure follow-up from drug
###   purchase records.
### Aliases: gen.exp
### Keywords: data manipulation

### ** Examples

# Example data for drug purchases in 3 persons --- dates (dop) are
# measured in years, amount purchased (amt) in no. pills and dose per
# time (dpt) consequently given in units of pills/year. Note we also
# include a person (id=4) with one purchase record only.
n <- c( 10, 18, 8, 1 )
hole <- rep(0,n[2])
hole[10] <- 2 # to create a hole of 2 years in purchase dates
# dates of drug purchase
dop <- c( 1995.278+cumsum(sample(1:4/10,n[1],replace=TRUE)),
          1992.351+cumsum(sample(1:4/10,n[2],replace=TRUE)+hole),
          1997.320+cumsum(sample(1:4/10,n[3],replace=TRUE)),
          1996.470 )
# purchased amounts mesured in no. pills
amt <- sample( 1:3*50 , sum(n), replace=TRUE )
# prescribed dosage therefore necessarily as pills per year 
dpt <- sample( 4:1*365, sum(n), replace=TRUE )
# collect to purchase data frame
dfr <- data.frame( id = rep(1:4,n),
                  dop,
                  amt = amt,
                  dpt = dpt )
head( dfr, 3 )

# a simple dataframe for follow-up periods for these 4 persons
fu <- data.frame( id = 1:4,
                 doe = c(1995,1992,1996,1997)+1:4/4,
                 dox = c(2001,2003,2002,2010)+1:4/5 )
fu

# Note that the following use of gen.exp relies on the fact that the
# purchase dataframe dfr has variable names "id", "dop", "amt" and
# "dpt"" and the follow-up data frame fu has variable names "id",
# "doe" and "dox"

# 1: using the dosage information
dposx <- gen.exp( dfr,
                   fu = fu,
              use.dpt = TRUE,
               breaks = seq(1990,2015,0.5),
                 lags = 2:4/4,
              lag.pre = "l_" )
format( dposx, digits=5 )

# 2: ignoring the dosage information,
#    hence person 4 with only one purchase is omitted
xposx <- gen.exp( dfr,
                   fu = fu,
              use.dpt = FALSE,
               breaks = seq(1990,2015,0.5),
                 lags = 2:3/5 )
format( xposx, digits=5 )

# It is possible to have disjoint follow-up periods for the same person:
fu <- fu[c(1,2,2,3),]
fu$dox[2] <- 1996.2
fu$doe[3] <- 1998.3
fu

# Note that drug purchase information for the period not at risk *is* used
dposx <- gen.exp( dfr,
                   fu = fu,
              use.dpt = TRUE,
               breaks = seq(1990,2015,0.1),
                 lags = 2:4/4 )
format( dposx, digits=5 )



