library(umx)


### Name: umx_aggregate
### Title: Convenient formula-based cross-tabs & built-in summary functions
### Aliases: umx_aggregate

### ** Examples

# =====================================
# = Basic use, compare with aggregate =
# =====================================
aggregate(mpg ~ cyl, FUN = mean, na.rm = TRUE, data = mtcars)
umx_aggregate(mpg ~ cyl, data = mtcars)

# =============================================
# = Use different (or user-defined) functions =
# =============================================
umx_aggregate(mpg ~ cyl, data = mtcars, what = "n")
umx_aggregate(mpg ~ cyl, data = mtcars, what = function(x){sum(!is.na(x))})

# turn off markdown
umx_aggregate(mpg ~ cyl, data = mtcars, report = "txt")

# ============================================
# = More than one item on the left hand side =
# ============================================
umx_aggregate(cbind(mpg, qsec) ~ cyl, data = mtcars, digits = 3)
# Transpose table
t(umx_aggregate(cbind(mpg, qsec) ~ cyl, data = mtcars))

## Not run: 
##D umx_aggregate(cbind(moodAvg, mood) ~ condition, data = study1)
## End(Not run)



