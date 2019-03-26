library(gdata)


### Name: ConvertMedUnits
### Title: Convert medical measurements between International Standard (SI)
###   and US 'Conventional' Units.
### Aliases: ConvertMedUnits
### Keywords: manip

### ** Examples

data(MedUnits)

# show available conversions
MedUnits$Measurement

# Convert SI Glucose measurement to 'Conventional' units
GlucoseSI = c(5, 5.4, 5, 5.1, 5.6, 5.1, 4.9, 5.2, 5.5) # in SI Units
GlucoseUS = ConvertMedUnits( GlucoseSI, "Glucose", to="US" )
cbind(GlucoseSI,GlucoseUS)

## Not run: 
##D # See what happens when there is more than one match
##D ConvertMedUnits( 27.5, "Creatin", to="US")
## End(Not run)

# To solve the problem do:
ConvertMedUnits( 27.5, "Creatinine", to="US", exact=TRUE)



