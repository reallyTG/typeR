library(Publish)


### Name: labelUnits
### Title: labelUnits
### Aliases: labelUnits

### ** Examples


data(Diabetes)
tab <- summary(univariateTable(gender~AgeGroups+chol+waist,data=Diabetes))
publish(tab)
ltab <- labelUnits(tab,"chol"="Cholesterol (mg/dL)","<40"="younger than 40")
publish(ltab)

## pass labels immediately to utable
utable(gender~AgeGroups+chol+waist,data=Diabetes,
      "chol"="Cholesterol (mg/dL)","<40"="younger than 40")

## sometimes useful to state explicitly which variables value
## should be re-labelled
utable(gender~AgeGroups+chol+waist,data=Diabetes,
      "chol"="Cholesterol (mg/dL)","AgeGroups.<40"="younger than 40")



