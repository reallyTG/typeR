library(MESS)


### Name: common.shared
### Title: Compute a common shared environment matrix
### Aliases: common.shared common.shared.pedigreeList
###   common.shared.pedigree
### Keywords: datagen

### ** Examples


library(kinship2)
test1 <- data.frame(id  =c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14),
                    mom =c(0, 0, 0, 0, 2, 2, 4, 4, 6,  2,  0,  0, 12, 13),
                    dad =c(0, 0, 0, 0, 1, 1, 3, 3, 3,  7,  0,  0, 11, 10),
                    sex =c(1, 2, 1, 2, 1, 2, 1, 2, 1,  1,  1,  2,  2,  2))
tped <- with(test1, pedigree(id, dad, mom, sex))
common.shared(tped)




