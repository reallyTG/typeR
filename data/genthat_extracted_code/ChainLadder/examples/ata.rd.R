library(ChainLadder)


### Name: ata
### Title: Calculate Age-to-Age Factors
### Aliases: ata

### ** Examples

ata(GenIns)

# Volume weighted average age-to-age factor of the "RAA" data
y <- attr(ata(RAA), "vwtd")
y
# "To ultimate" factors with a 10% tail
y <- rev(cumprod(rev(c(y, 1.1))))
names(y) <- paste(colnames(RAA), "Ult", sep="-")
y

## Label the development columns in "ratio-type" format
ata(RAA, colname.sep=":", colname.order="desc")




