library(mitml)


### Name: amelia2mitml.list
### Title: Convert objects of class 'amelia' to 'mitml.list'
### Aliases: amelia2mitml.list

### ** Examples

data(studentratings)

require(Amelia)
imp <- amelia(x=studentratings[,c("ID","MathAchiev","ReadAchiev")], cs="ID")

implist <- amelia2mitml.list(imp)



