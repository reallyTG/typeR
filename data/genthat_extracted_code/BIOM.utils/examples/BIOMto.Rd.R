library(BIOM.utils)


### Name: BIOM Import
### Title: Attach formal type to BIOM data (import)
### Aliases: biom biom.matrix biom.list biom.character

### ** Examples

tt <- tempfile()

##  two ways to the same result:
ff <- exampleBiomFile()
txt <- readLines (ff)
biom (txt)
biom (file=ff)

##  choose what fields to include with a list:
biom (list (data=smat, matrix_type="sparse", shape=c(266,4),
	matrix_element_type="unicode", comment="no comment"), quiet=TRUE)

xx <- matrix2list (cbind (LETTERS[1:20], paste ("some metadata for row", 1:20)))
xx <- lapply (xx, "names<-", c("id", "metadata"))
biom (list (data=dmat, type="Gene table", rows=xx, id="1234567890"), quiet=TRUE)

##  the same result in two ways, again:
write.table (dmat, file=tt, sep=",")
biom (dmat, "Function table")
biom (as.matrix (read.table (file=tt, sep=",")), "Func")

##  all the same:
biom (smat, sparse=TRUE, quiet=TRUE)
biom (smat, sparse=c(266,4), quiet=TRUE)
biom (smat, sparse=list (paste ("row", 1:266), paste ("column", 1:4)), quiet=TRUE)

##  enforce matrix_element_type to be "int":
mm <- dmat
storage.mode (mm) <- "integer"
biom (mm, quiet=TRUE)

unlink (tt)



