library(gap)


### Name: kin.morgan
### Title: kinship matrix for simple pedigree
### Aliases: kin.morgan
### Keywords: datagen

### ** Examples

## Not run: 
##D # Werner syndrome pedigree
##D werner<-c(
##D  1, 0,  0,  1,
##D  2, 0,  0,  2,
##D  3, 0,  0,  2,
##D  4, 1,  2,  1,
##D  5, 0,  0,  1,
##D  6, 1,  2,  2,
##D  7, 1,  2,  2,
##D  8, 0,  0,  1,
##D  9, 4,  3,  2,
##D 10, 5,  6,  1,
##D 11, 5,  6,  2,
##D 12, 8,  7,  1,
##D 13,10,  9,  2,
##D 14,12, 11,  1,
##D 15,14, 13,  1)
##D werner<-t(matrix(werner,nrow=4))
##D kin.morgan(werner[,1:3])
## End(Not run)



