library(qdap)


### Name: mcsv_r
### Title: Read/Write Multiple csv Files at a Time
### Aliases: mcsv_r mcsv_w

### ** Examples

## Not run: 
##D ## mcsv_r EXAMPLE:
##D mtcarsb <- mtcars[1:5, ]; CO2b <- CO2[1:5, ]
##D (a <- mcsv_w(mtcarsb, CO2b, dir="foo"))
##D rm("mtcarsb", "CO2b")  # gone from .GlobalEnv
##D (nms <- dir(a))
##D mcsv_r(file.path(a, nms))
##D mtcarsb; CO2b
##D rm("mtcarsb", "CO2b")  # gone from .GlobalEnv
##D mcsv_r(file.path(a, nms), paste0("foo.dat", 1:2))
##D foo.dat1; foo.dat2
##D rm("foo.dat1", "foo.dat2")  # gone from .GlobalEnv
##D library(reports); delete("foo")
##D 
##D ## mcsv_w EXAMPLES:
##D (a <- mcsv_w(mtcars, CO2, dir="foo"))
##D delete("foo")
##D 
##D ## Write lists of dataframes as well
##D poldat <- with(DATA.SPLIT, polarity(state, person))
##D term <- c("the ", "she", " wh")
##D termdat <- with(raj.act.1,  termco(dialogue, person, term))
##D mcsv_w(poldat, termdat, mtcars, CO2, dir="foo2")
##D delete("foo2")
## End(Not run)



