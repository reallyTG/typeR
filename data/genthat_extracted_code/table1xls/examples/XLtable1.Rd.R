library(table1xls)


### Name: XLtable1
### Title: "Table 1" Style List of Tables exported to a spreadsheet
### Aliases: XLtable1

### ** Examples

table1<-XLwriteOpen("table1.xls") 

## A default, option-free call generates one-way tables
XLtable1(table1,'cars1',mtcars[,c(2,8:11)])
## You can prettify a bit, first by changing variable names

names(mtcars)[c(2,8:11)]=c("Cylinders","V/S","Auto/Manual","Gears","Carbureutors")
XLtable1(table1,'cars1',mtcars[,c(2,8:11)],
         title="'mtcars': Summary of Categorical Variables",col1=4)

## Now two-way, generated implicitly by specifying 'colvar' (unless fun=XLunivariate)
XLtable1(table1,'cars2',mtcars[,8:11],colvar=mtcars$Cylinders,
         title="Cylinders vs. categorical variables",colTitle="Cylinders")

## Finally, two-way numerical summaries for continuous variables
names(mtcars)[c(1,3:7)]=c('MPG','Engine Vol.','HP',"Axle Ratio","Weight","Quarter Mile")
XLtable1(table1,'carsContinuous',mtcars[,c(1,3:7)],fun=XLunivariate,colvar=mtcars$Cylinders,
         title="Cylinders vs. continuous variables",colTitle="Cylinders")

cat("Look for",paste(getwd(),"table1.xls",sep='/'),"to see the results!\n")



