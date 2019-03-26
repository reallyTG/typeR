library(SmartEDA)


### Name: ExpCatViz
### Title: Distributions of categorical variables
### Aliases: ExpCatViz

### ** Examples

ExpCatViz(data=mtcars,gp=NULL,fname=file.path(tempdir(),"Cat_1"),clim=10,margin=1,Page = c(2,2))
## Generate Bar graph for all the descrete data with column based proportions - random colors
set.seed(1234)
ExpCatViz(data=mtcars,gp="gear",fname=file.path(tempdir(),"Cat_2"),clim=10,margin=2,Page = c(2,2))
## Bar graph for specified variable
mtdata <- mtcars
mtdata$carname <- rownames(mtcars)
ExpCatViz(data=mtdata,gp="carname",col="blue",rdata=TRUE,value="mpg")



