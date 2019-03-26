library(kinship2)


### Name: kinship
### Title: Compute a kinship matrix
### Aliases: kinship kinship.default kinship.pedigree kinship.pedigreeList
### Keywords: genetics

### ** Examples

test1 <- data.frame(id  =c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14),
                    mom =c(0, 0, 0, 0, 2, 2, 4, 4, 6,  2,  0,  0, 12, 13),
                    dad =c(0, 0, 0, 0, 1, 1, 3, 3, 3,  7,  0,  0, 11, 10),
                    sex =c(0, 1, 0, 1, 0, 1, 0, 1, 0,  0,  0,  1,  1,  1))
tped <- with(test1, pedigree(id, dad, mom, sex))
round(8*kinship(tped))




