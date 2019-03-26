library(table1)


### Name: parse.abbrev.render.code
### Title: Parse abbreviated code for rendering table output.
### Aliases: parse.abbrev.render.code
### Keywords: utilities

### ** Examples

## Not run: 
##D x <- round(exp(rnorm(100, log(20), 1)), 2)
##D stats.default(x)
##D f <- parse.abbrev.render.code(c("Mean (SD)", "Median [Min, Max]"), 3)
##D f(x)
##D f2 <- parse.abbrev.render.code(c("Geo. Mean (Geo. CV%)" = "GMean (GCV%)"), 3)
##D f2(x)
##D f3 <- parse.abbrev.render.code(c("Mean (SD)"), 3)
##D f3(x)
##D 
##D x <- sample(c("Male", "Female"), 30, replace=T)
##D stats.default(x)
##D f <- parse.abbrev.render.code("Freq (Pct%)")
##D f(x)
## End(Not run)




