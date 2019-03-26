library(solrad)


### Name: AST
### Title: Apparent Solar Time
### Aliases: AST
### Keywords: AST

### ** Examples


#Calculating apparent solar time for two consecutive days

DOY <- seq(0, 2, .05)

ast <- AST(DOY, Lon=0, SLon=0, DS=60)
#Note: only the difference between Lon and SLon matters not each value

plot(DOY, ast)




