library(memisc)


### Name: ftable-matrix
### Title: Combining flattened tables.
### Aliases: ftable_matrix cbind.ftable rbind.ftable cbind.ftable_matrix
###   rbind.ftable_matrix format.ftable_matrix print.ftable_matrix
###   Write.ftable_matrix

### ** Examples

ft1 <- ftable(Sex~Survived,Titanic)
ft2 <- ftable(Age+Class~Survived,Titanic)
ft3 <- ftable(Survived~Class,Titanic)
ft4 <- ftable(Survived~Age,Titanic)
ft5 <- ftable(Survived~Sex,Titanic)

tab10 <- xtabs(Freq~Survived,Titanic)

(c12.10 <- cbind(ft1,ft2,Total=tab10))
(r345.10 <- rbind(ft3,ft4,ft5,Total=tab10))

## Not run: 
##D tf <- tempfile()
##D Write(c12.10,file=tf)
##D file.show(tf)
## End(Not run)



