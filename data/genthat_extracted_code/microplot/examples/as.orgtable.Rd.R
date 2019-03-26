library(microplot)


### Name: as.orgtable
### Title: Prepare a matrix or data.frame to be used as an org-mode table
### Aliases: as.orgtable
### Keywords: utilities

### ** Examples

tmp <- matrix(1:12, 3, 4, dimnames=list(letters[1:3], LETTERS[4:7]))
tmp
as.orgtable(tmp)
as.orgtable(tmp, rownames=TRUE)

tmpdf <- data.frame(tmp)
tmpdf
cat(as.orgtable(tmpdf), sep="\n")
cat(as.orgtable(tmpdf, rownames=TRUE), sep="\n")

## This example shows why row names default to FALSE.

tmp2 <- rbind(tmp, tmp)
tmp2
tmp2df <- data.frame(tmp2)
tmp2df

tmp2df <- cbind(" "=row.names(tmp2), group=rep(c("A","B"), each=3), tmp2df)
tmp2df

cat(as.orgtable(tmp2df), sep="\n")  ## this is what we want

## this has the unwanted initial column of 1:6
cat(as.orgtable(tmp2df, rownames=TRUE), sep="\n")



