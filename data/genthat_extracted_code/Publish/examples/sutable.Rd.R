library(Publish)


### Name: sutable
### Title: Fast summary of a univariate table
### Aliases: sutable

### ** Examples

data(Diabetes)
sutable(gender~age+location+Q(BMI)+height+weight,data=Diabetes,BMI="Body mass index (kg/m^2)")



