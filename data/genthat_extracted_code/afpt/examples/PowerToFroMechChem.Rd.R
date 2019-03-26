library(afpt)


### Name: PowerToFroMechChem
### Title: Convert between mechanical and chemical power
### Aliases: mech2chem chem2mech

### ** Examples

## Define a bird:
myBird = Bird(
  massTotal = 0.215, #  (kg) total body mass
  wingSpan = 0.67, #  (m) maximum wing span
  wingArea = 0.0652, #  (m2) maximum wing area
  type = "passerine"
)

## define a speed range
speedrange <- seq(5,14,length.out=5)

## compute aerodynamic power for that speed range:
Paero <- computeFlappingPower(myBird,speedrange)
Pchem <- Paero
Pchem$power <- mech2chem(Paero$power,myBird)
print(Pchem[c("speed","power","frequency","strokeplane")])
#   speed    power frequency strokeplane
# 1  5.00 15.60151  5.948083    46.56887
# 2  7.25 12.44362  5.948083    31.89129
# 3  9.50 12.79900  5.948083    22.51896
# 4 11.75 15.36721  5.948083    16.49120
# 5 14.00 19.82915  5.948083    12.09174

Pmech <- Pchem
Pmech$power <- chem2mech(Pchem$power,myBird)
print(Pmech[c("speed","power","frequency","strokeplane")])
#   speed    power frequency strokeplane
# 1  5.00 2.789751  5.948083    46.56887
# 2  7.25 2.129466  5.948083    31.89129
# 3  9.50 2.203773  5.948083    22.51896
# 4 11.75 2.740763  5.948083    16.49120
# 5 14.00 3.673714  5.948083    12.09174



