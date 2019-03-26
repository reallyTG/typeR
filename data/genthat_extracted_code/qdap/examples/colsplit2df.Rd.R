library(qdap)


### Name: colsplit2df
### Title: Wrapper for colSplit that Returns Dataframe(s)
### Aliases: colsplit2df lcolsplit2df
### Keywords: column-split

### ** Examples

## Not run: 
##D CO2$`Plant&Type&Treatment` <- paste2(CO2[, 1:3])
##D CO2 <- CO2[, -c(1:3)]
##D head(CO2)
##D head(colsplit2df(CO2, 3))
##D head(colsplit2df(CO2, 3, qcv(A, B, C)))
##D head(colsplit2df(CO2, 3, qcv(A, B, C), keep.orig=TRUE))
##D head(colsplit2df(CO2, "Plant&Type&Treatment"))
##D CO2 <- datasets::CO2
##D 
##D (dat <- colpaste2df(head(mtcars), list(1:3), sep = "|"))
##D colsplit2df(dat, 12, sep = "|")
##D 
##D ## Multiple split example
##D E <- list(
##D     c(1, 2, 3, 4, 5),
##D     qcv(mpg, hp),
##D     c("disp", "am")
##D )
##D 
##D (dat2 <- colpaste2df(head(mtcars), E, sep ="|"))
##D cols <- c("mpg&cyl&disp&hp&drat", "mpg&hp", "disp&am")
##D colsplit2df(dat2, cols, sep = "|")
##D 
##D ## lcolsplit2df example
##D (x <- with(DATA.SPLIT, question_type(state, list(sex, adult))))
##D ltruncdf(x)
##D z <- lcolsplit2df(x)
##D ltruncdf(z)
## End(Not run)



