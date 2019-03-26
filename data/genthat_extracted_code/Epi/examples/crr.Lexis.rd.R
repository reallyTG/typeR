library(Epi)


### Name: crr.Lexis
### Title: Fit a competing risks regression model (Fine-Gray model) using a
###   Lexis object)
### Aliases: crr.Lexis
### Keywords: survival

### ** Examples

# Thorotrats patients, different histological types of liver cancer
# Load thorotrast data, and restrict to exposed
data(thoro)
tht <- thoro[thoro$contrast==1,]
# Define exitdate as the date of livercancer
tht$dox <- pmin( tht$liverdat, tht$exitdat, na.rm=TRUE )
tht <- subset( tht, dox > injecdat )
# Convert to calendar years in dates
tht <- cal.yr( tht )

# Set up a Lexis object with three subtypes of liver cancer and death
tht.L <- Lexis( entry = list( per = injecdat,
                              tfi = 0 ),
                 exit = list( per = dox ),
          exit.status = factor( 1*hepcc+2*chola+3*hmang+
                                4*(hepcc+chola+hmang==0 & exitstat==1),
                                labels=c("No cancer","hepcc","chola","hmang","Dead") ),
                 data = tht )
summary( tht.L )

# Show the transitions
boxes( tht.L, boxpos=list(x=c(20,rep(80,3),30),
                          y=c(60,90,60,30,10) ),
              show.BE=TRUE, scale.R=1000 )

# Fit a model for the Hepatocellular Carcinoma as outcome
# - note that you can create a variable on the fly:
library( cmprsk )
hepcc <- crr.Lexis( tht.L, "hepcc" ~ volume + I(injecdat-1940) )
hepcc$model.Lexis
hepcc$transitions

# Models for the three other outcomes:
chola <- crr.Lexis( tht.L, "chola" ~ volume + I(injecdat-1940) )
hmang <- crr.Lexis( tht.L, "hmang" ~ volume + I(injecdat-1940) )
dead  <- crr.Lexis( tht.L, "Dead"  ~ volume + I(injecdat-1940) )

# Compare the effects
# NOTE: This is not necessarily a joint model for all transitions.
zz <- rbind( ci.exp(hepcc),
             ci.exp(chola),
             ci.exp(hmang),
             ci.exp(dead) )
zz <- cbind( zz[c(1,3,5,7)  ,],
             zz[c(1,3,5,7)+1,] )
rownames( zz ) <- c("hepcc","chola","hmang","dead")
colnames( zz )[c(1,4)] <- rownames( ci.exp(chola) )
round( zz, 3 )



