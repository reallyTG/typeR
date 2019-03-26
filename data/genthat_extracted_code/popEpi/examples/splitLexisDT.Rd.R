library(popEpi)


### Name: splitLexisDT
### Title: Split case-level observations
### Aliases: splitLexisDT

### ** Examples

library(Epi)
data("sire", package = "popEpi")
x <- Lexis(data=sire[1000:1100, ], 
           entry = list(fot=0, per=get.yrs(dg_date), age=dg_age), 
           exit=list(per=get.yrs(ex_date)), exit.status=status)
BL <- list(fot=seq(0, 5, by = 3/12), per=c(2008, 2013))

x2 <- splitMulti(x, breaks = BL, drop = FALSE)

x3 <- splitLexisDT(x, breaks = BL$fot, timeScale = "fot", drop = FALSE)
x3 <- splitLexisDT(x3, breaks = BL$per, timeScale = "per", drop = FALSE)

x4 <- splitLexis(x,  breaks = BL$fot, time.scale = "fot")
x4 <- splitLexis(x4, breaks = BL$per, time.scale = "per")
## all produce identical results

## using Date variables
x <- Lexis(data=sire[1000:1100, ], 
           entry = list(fot=0, per=dg_date, age=dg_date-bi_date), 
           exit=list(per=ex_date), exit.status=status)
BL <- list(fot = 0:5*365.25, per = as.Date(c("2008-01-01", "2013-01-01")))

x2 <- splitMulti(x, breaks = BL, drop = FALSE)

x3 <- splitLexisDT(x, breaks = BL$fot, timeScale = "fot", drop = FALSE)
x3 <- splitLexisDT(x3, breaks = BL$per, timeScale = "per", drop = FALSE)

## splitLexis may not work when using Dates



