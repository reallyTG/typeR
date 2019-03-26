library(huxtable)


### Name: as_huxtable
### Title: Convert objects to huxtables
### Aliases: as_huxtable as_hux as_huxtable.default is_huxtable is_hux

### ** Examples

dfr <- data.frame(
        a = 1:5,
        b = letters[1:5],
        stringsAsFactors = FALSE
      )
as_huxtable(dfr)
mx <- matrix(letters[1:12], 4, 3)
as_huxtable(mx)
library(stats)
tbl <- table(
        Wool    = warpbreaks$wool,
        Tension = warpbreaks$tension
      )
as_huxtable(tbl) # adds row and column names by default

# adding rownames:
as_hux(mtcars[1:3,], add_colnames = TRUE,
      add_rownames = "Car")




