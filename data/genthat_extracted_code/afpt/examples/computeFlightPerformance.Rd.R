library(afpt)


### Name: computeFlightPerformance
### Title: Compute characteristics of a power curve
### Aliases: computeFlightPerformance

### ** Examples

## Define a bird:
myBird = Bird(
  name = "Jackdaw",
  name.scientific = "Corvus monedula",
  massTotal = 0.215, #  (kg) total body mass
  wingSpan = 0.67, #  (m) maximum wing span
  wingArea = 0.0652, #  (m2) maximum wing area
  type = "passerine"
)

## simplest performance calculation
performance.myBird <- computeFlightPerformance(myBird,strokeplane=0)
performance.myBird
# Name: Jackdaw
# Sc. name: Corvus monedula
# Bird definitions: NA
#               speed power.aero power.chem strokeplane amplitude
# minimumSpeed  3.783      5.228      27.26           0      43.5
# minimumPower  8.227      2.138      12.49           0      31.7
# maximumRange 11.102      2.558      14.49           0      35.1
# maximumSpeed 16.587      5.234      27.29           0      49.6
# Maximum climb performance:
#                  speed power.aero power.chem strokeplane amplitude climbRate
# maximumClimbRate  9.15      5.234      27.29           0      49.4     1.153

## Not run: 
##D  # computationally intensive
##D ## optimize strokeplane angle and use speed dependent frequency
##D funFrequency = function(U){19.8 - 4.7*U + 0.45*U^2 - 0.0138*U^3}
##D performance.myBird <- computeFlightPerformance(myBird,strokeplane='opt',frequency=funFrequency)
##D performance.myBird
##D # Name: Jackdaw
##D # Sc. name: Corvus monedula
##D # Bird definitions: NA
##D #               speed power.aero power.chem strokeplane amplitude
##D # minimumSpeed  2.293      5.229      27.27        49.9      43.8
##D # minimumPower  8.192      2.319      13.35        21.6      42.8
##D # maximumRange 11.463      2.775      15.53        14.9      44.3
##D # maximumSpeed 16.088      5.233      27.29         8.3      64.5
##D # Maximum climb performance:
##D #                  speed power.aero power.chem strokeplane amplitude climbRate
##D # maximumClimbRate 9.688      5.234      27.29        17.5      61.7     1.015
##D 
##D ## plot variation of speed, power and flapping kinematics
##D plot(performance.myBird$powercurve[c('speed','power.aero','strokeplane','frequency','amplitude')])
## End(Not run) # end dontrun

## plot power factors
plot(performance.myBird$powercurve[c('speed','power.aero')])
plot(performance.myBird$powercurve[c('speed','kP.ind')])
plot(performance.myBird$powercurve[c('speed','kP.pro0')])
plot(performance.myBird$powercurve[c('speed','kP.pro2')])




