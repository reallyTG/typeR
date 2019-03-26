library(rio)


### Name: rio
### Title: A Swiss-Army Knife for Data I/O
### Aliases: rio rio-package

### ** Examples

# export
library("datasets")
export(mtcars, "mtcars.csv") # comma-separated values
export(mtcars, "mtcars.rds") # R serialized
export(mtcars, "mtcars.sav") # SPSS

# import
x <- import("mtcars.csv")
y <- import("mtcars.rds")
z <- import("mtcars.sav")

# convert
convert("mtcars.sav", "mtcars.dta")

# cleanup
unlink(c("mtcars.csv", "mtcars.rds", "mtcars.sav", "mtcars.dta"))




