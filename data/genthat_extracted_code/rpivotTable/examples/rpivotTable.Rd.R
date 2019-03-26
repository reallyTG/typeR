library(rpivotTable)


### Name: rpivotTable
### Title: pivottable.js in R
### Aliases: rpivotTable

### ** Examples


 # use Titanic dataset provided in base R - simple creation with just data

 rpivotTable( Titanic )

 # prepopulate multiple columns and multiple rows

 rpivotTable( Titanic, rows = c("Class","Sex"), cols = c("Age","Survived" ) )


 # A more complete example:

 rpivotTable(
 Titanic,
 rows = "Survived",
 cols = c("Class","Sex"),
 aggregatorName = "Sum as Fraction of Columns",
 vals = "Freq",
 rendererName = "Table Barchart"
 )

# An example with inclusions and exclusions filters:

rpivotTable(
Titanic,
rows = "Survived",
cols = c("Class","Sex"),
aggregatorName = "Sum as Fraction of Columns",
inclusions = list( Survived = list("Yes")),
exclusions= list( Class = list( "Crew")),
vals = "Freq",
rendererName = "Table Barchart"
)







