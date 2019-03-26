library(manymodelr)


### Name: row_mean_na
### Title: Replacing all NAs with mean values of a given row
### Aliases: row_mean_na

### ** Examples

#This merges our replacement values with the original data containing NAs
row_mean_na(airquality,mean,c("Ozone","Wind"),na.rm=TRUE,0)
## Not run: 
##D row_mean_na(iris,max,c("Sepal.Length","Petal.Length"),na.rm = F,5)
## End(Not run)



