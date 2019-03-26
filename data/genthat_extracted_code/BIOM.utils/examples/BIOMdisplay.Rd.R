library(BIOM.utils)


### Name: BIOM Display
### Title: Display BIOM data in full or part
### Aliases: str.biom summary.biom print.biomsummary print.biom head.biom
###   tail.biom

### ** Examples

##  one toy example, one real example:
xx <- biom (dmat, quiet=TRUE)
yy <- biom (li4)

summary (xx)
print (xx)
head (xx)
tail (xx)
tail (xx, n=10, p=3)

tail (yy)
tail (yy, n=15)

##  biom class is just a list:
str (yy)



