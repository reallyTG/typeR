library(kinship2)


### Name: makekinship
### Title: Create a sparse kinship matrix
### Aliases: makekinship
### Keywords: genetics

### ** Examples

# Data set from a large family study of breast cancer
#  there are 26050 subjects in the file, from 426 families
## Not run: 
##D > table(cdata$sex)
##D      F     M 
##D  12699 13351
##D > length(unique(cdata$famid))
##D [1] 426
##D 
##D > kin1 <- makekinship(cdata$famid, cdata$gid, cdata$dadid, cdata$momid)
##D > dim(kin1)
##D [1] 26050 26050
##D > class(kin1)
##D [1] "bdsmatrix"
##D # The next line shows that few of the elements of the full matrix are >0
##D > length(kin1@blocks)/ prod(dim(kin1))
##D [1] 0.00164925
##D 
##D # kinship matrix for the females only
##D > femid <- cdata$gid[cdata$sex=='F']
##D > femindex <- !is.na(match(dimnames(kin1)[[1]], femid))
##D > kin2 <- kin1[femindex, femindex]
##D #
##D # Note that "femindex <- match(femid, dimnames(kin1)[[1]])" is wrong, since
##D #  then kin1[femindex, femindex] might improperly reorder the rows/cols 
##D #  (if families were not contiguous in cdata).  
##D # However sort(match(femid, dimnames(kin1)[[1]])) would be okay.
## End(Not run)


