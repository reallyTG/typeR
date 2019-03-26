library(NITPicker)


### Name: findPathF2
### Title: Find best subset of points for follow-up experiments, using F2
###   metric
### Aliases: findPathF2

### ** Examples

#load data:
# a matrix with 12 rows, representing months (time) 
# and 35 columns, representing cities (experiments) 
mat=CanadianWeather$monthlyTemp 
y=CanadianWeather$monthlyTemp[,"Resolute"]
#find a set of points that help predict the shape of the curve
## No test: 
a=findPathF2(c(1:12), y, mat, 5, numPerts=3) #make numPerts>=20 for real data
## End(No test)
## No test: 
print(a) #indices of months to select for follow-up experiments
## End(No test)
## No test: 
print(rownames(CanadianWeather$monthlyTemp)[a]) #month names selected
## End(No test)





