library(NITPicker)


### Name: findPathF1
### Title: Find best subset of points for follow-up experiments, using F1
###   metric
### Aliases: findPathF1

### ** Examples

 
#load data:
#matrix with 12 rows, representing months (time)
#and 35 columns, representing cities (experiments)
mat=CanadianWeather$monthlyTemp 
#find a set of points that help predict the shape of the curve:
## No test: 
a=findPathF1(c(1:12), mat, 5, numPerts=3) #make numPerts>=20 for real data 
## End(No test)
## No test: 
print(a) #indices of months to select for follow-up experiments
## End(No test)
## No test: 
print(rownames(CanadianWeather$monthlyTemp)[a]) #month names selected
## End(No test)






