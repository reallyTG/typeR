library(tables)


### Name: RowFactor
### Title: Use a variable as a factor to give rows in a table.
### Aliases: Factor RowFactor Multicolumn

### ** Examples

tabular( Factor(1:10, "row") ~
       All(iris[1:10,])*Heading()*identity )
latex( tabular( RowFactor(1:10, "", 5)  ~ 
       All(iris[1:10,])*Heading()*identity )) 



