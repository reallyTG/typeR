library(Trading)


### Name: Curve-class
### Title: Curve Class
### Aliases: Curve

### ** Examples


## generating a curve either directly or through a csv -
## the spot_rates.csv file can be found on the extdata folder in the installation library path
funding_curve =  Curve(Tenors=c(1,2,3,4,5,6,10),Rates=c(4,17,43,47,76,90,110))
spot_rates = Curve()
spot_rates$PopulateViaCSV('spot_rates.csv')
time_points = seq(0,5,0.01)
spot_curve     = spot_rates$CalcInterpPoints(time_points)



