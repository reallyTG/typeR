library(pastecs)


### Name: buysbal
### Title: Buys-Ballot table
### Aliases: buysbal
### Keywords: ts

### ** Examples

data(releve)
buysbal(releve$Day, releve$Melosul, frequency=4, units="days",
        datemin="21/03/1989", dateformat="d/m/Y")
buysbal(releve$Day, releve$Melosul, frequency=4, units="days",
        datemin="21/03/1989", dateformat="d/m/Y", count=TRUE)



