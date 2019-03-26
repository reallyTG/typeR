library(rio)


### Name: import_list
### Title: Import list of data frames
### Aliases: import_list

### ** Examples

library('datasets')
export(list(mtcars1 = mtcars[1:10,], 
            mtcars2 = mtcars[11:20,],
            mtcars2 = mtcars[21:32,]), "mtcars.xlsx")

# import a single file from multi-object workbook
str(import("mtcars.xlsx", which = "mtcars1"))

# import all worksheets
str(import_list("mtcars.xlsx"), 1)

# import and rbind all worksheets
mtcars2 <- import_list("mtcars.xlsx", rbind = TRUE)
all.equal(mtcars2, mtcars, check.attributes = FALSE)

# import multiple files
export(mtcars, "mtcars.csv")
export(mtcars, "iris.csv")
str(import_list(dir(pattern = "csv$")), 1)

# cleanup
unlink("mtcars.xlsx")
unlink("mtcars.csv")
unlink("iris.csv")




