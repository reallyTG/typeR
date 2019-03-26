library(sfsmisc)


### Name: missingCh
### Title: Has a Formal Argument been Set or is it Missing?
### Aliases: missingCh
### Keywords: programming

### ** Examples

tst1 <- function(a, b, dd, ...) ## does not work an with argument named 'c' !
    c(b = missingCh("b"), dd = missingCh("dd"))
tst1(2)#-> both 'b' and 'dd' are missing
tst1(,3,,3)
##     b    dd
## FALSE  TRUE  -- as 'b' is not missing but 'dd' is.

Tst <- function(a,b,cc,dd,EEE, ...)
    vapply(c("a","b","cc","dd","EEE"), missingCh, NA, envir=environment())
Tst()
## TRUE ... TRUE -- as all are missing()
Tst(1,,3)
##     a     b    cc    dd   EEE
## FALSE  TRUE FALSE  TRUE  TRUE
## .....       .....
## as 'a' and 'cc' where not missing()

## Formal testing:
stopifnot(tst1(), !tst1(,3,3), Tst(),
                        Tst(1,,3, b=2, E="bar") == c(0,0,1,0,0))
## maybe surprising that this ^^ becomes 'dd' and only 'cc' is missing



