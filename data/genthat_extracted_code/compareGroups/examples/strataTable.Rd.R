library(compareGroups)


### Name: strataTable
### Title: Stratify descriptive table in stratas.
### Aliases: strataTable
### Keywords: misc

### ** Examples


require(compareGroups)

# load REGICOR data
data(regicor)

# compute the descriptive tables (by year)
restab <- descrTable(year ~ . - id - sex, regicor, hide.no="no")

# re-build the table stratifying by gender
strataTable(restab, "sex")




