library(nseval)


### Name: missing_value
### Title: R's missing value.
### Aliases: missing_value missing_ missing_.default missing_.dots
###   missing_.quotation list_missing

### ** Examples

# These expressions are equivalent:
function(x, y=1) {x+y}
function_(list(x=missing_value, y=1),
          quote( {x+y} ))

# These expressions are also equivalent:
quote(df[,1])
substitute(df[row,col],
           list(row = missing_value(), col = 1))
# How to do the trick of `[` where it can tell which arguments are
# missing:
`[.myclass` <- function(x, ...) {
   indices <- list_missing(...)
   kept.axes <- which(missing_(indices))
   cat(paste0("Keeping axes ", kept_axes, "\n"))
   #...
}
ar <- structure(array(1:24, c(2, 3, 4)))
ar[, 3, ]



