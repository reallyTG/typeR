library(kinship2)


### Name: pedigree
### Title: Create pedigree structure
### Aliases: pedigree as.data.frame.pedigree print.pedigree
### Keywords: genetics

### ** Examples

data(minnbreast)

bpeds <- with(minnbreast,
    pedigree(id, fatherid, motherid, sex, affected=proband, famid=famid))

## pedigree with id=8
bped.id8 <- bpeds['8']
print(bped.id8)
plot(bped.id8)

## show this pedigree with mixed zygosity quadruplets
rel8 <- data.frame(id1=c(137,138,139), id2=c(138,139,140), code=c(1,2,2))
bped.id8 <- with(minnbreast[minnbreast$famid==8,],
     pedigree(id, fatherid, motherid, sex, affected=proband, relation=rel8))
plot(bped.id8)


## the 8th pedigree
bped8 <- bpeds[8]

print(bped8)
plot(bped8, cex=.5)




