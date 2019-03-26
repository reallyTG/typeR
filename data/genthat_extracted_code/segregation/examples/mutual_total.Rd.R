library(segregation)


### Name: mutual_total
### Title: Calculate total segregation for M and H
### Aliases: mutual_total

### ** Examples

# calculate school racial segregation
mutual_total(schools00, "school", "race", weight="n") # M => .425

# note that the definition of groups and units is arbitrary
mutual_total(schools00, "race", "school", weight="n") # M => .425

# if groups or units are defined by a combination of variables,
# vectors of variable names can be provided -
# here there is no difference, because schools
# are nested within districts
mutual_total(schools00, "race", c("district", "school"),
             weight="n") # M => .424

# estimate standard errors for M and H
mutual_total(schools00, "race", "school", weight="n", se=TRUE)

# estimate segregation within school districts
mutual_total(schools00, "race", "school",
             within="district", weight="n") # M => .087

# estimate between-district racial segregation
mutual_total(schools00, "race", "district", weight="n") # M => .338
# note that the sum of within-district and between-district
# segregation equals total school-race segregation;
# here, most segregation is between school districts



