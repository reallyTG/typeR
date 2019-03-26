library(SmartEDA)


### Name: ExpNumViz
### Title: Distributions of numeric variables
### Aliases: ExpNumViz

### ** Examples

## Generate Boxplot by category
ExpNumViz(mtcars,gp="gear",type=2,nlim=25,fname = file.path(tempdir(),"Mtcars2"),Page = c(2,2))
## Generate Density plot
ExpNumViz(mtcars,gp=NULL,type=3,nlim=25,fname = file.path(tempdir(),"Mtcars3"),Page = c(2,2))
## Generate Scatter plot
ExpNumViz(mtcars,gp="carb",type=3,nlim=25,fname = file.path(tempdir(),"Mtcars4"),Page = c(2,2))



