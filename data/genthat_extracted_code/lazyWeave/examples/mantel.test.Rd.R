library(lazyWeave)


### Name: mantel.test
### Title: Mantel-Haenszel test for two-way tables
### Aliases: mantel.test

### ** Examples

mantel.test(mtcars$gear,mtcars$cyl)

mantel.test(table(mtcars$gear,mtcars$cyl))

mantel.test(table(mtcars$gear,mtcars$cyl), row.scores="midrank")

mantel.test(table(mtcars$gear,mtcars$cyl), col.scores="midrank")



