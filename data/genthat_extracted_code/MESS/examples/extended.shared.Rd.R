library(MESS)


### Name: extended.shared
### Title: Compute a common shared environment matrix
### Aliases: extended.shared extended.shared.pedigreeList
###   extended.shared.pedigree
### Keywords: datagen

### ** Examples


library(kinship2)
test1 <- data.frame(id  =c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14),
                    mom =c(0, 0, 0, 0, 0, 2, 2, 4, 0,  6,  8,  0, 10, 11),
                    dad =c(0, 0, 0, 0, 0, 1, 1, 3, 0,  5,  7,  0,  9, 12),
                    sex =c(1, 2, 1, 2, 1, 2, 1, 2, 1,  2,  2,  1,  2,  2))

tped <- with(test1, pedigree(id, dad, mom, sex))
extended.shared(tped)




