library(sfsmisc)


### Name: u.datumdecode
### Title: Convert "Numeric" Dates
### Aliases: u.datumdecode
### Keywords: utilities

### ** Examples

u.datumdecode(8710230920)
##  Jahr Monat   Tag   Std   Min
##    87    10    23     9    20

u.datumdecode(c(8710230900, 9710230920, 0210230920))
##      Jahr Monat Tag Std Min
## [1,]   87    10  23   9  00
## [2,]   97    10  23   9  20
## [3,]    2    10  23   9  20



