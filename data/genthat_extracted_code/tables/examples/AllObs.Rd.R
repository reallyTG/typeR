library(tables)


### Name: AllObs
### Title: Display all observations in a table.
### Aliases: AllObs RowNum

### ** Examples

tabular(Factor(cyl)*Factor(gear)*AllObs(mtcars) ~ 
               rownames(mtcars) + mpg, data=mtcars)
    
rownum <- with(mtcars, RowNum(list(cyl, gear)))
tabular(Factor(cyl)*Factor(gear)*I(rownum) ~
        mpg * AllObs(mtcars, within = list(cyl, gear, rownum)), 
        data=mtcars)



