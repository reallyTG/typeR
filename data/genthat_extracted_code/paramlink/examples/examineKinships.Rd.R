library(paramlink)


### Name: examineKinships
### Title: Check pedigree for relationship errors
### Aliases: examineKinships

### ** Examples


x = cousinsPed(1)
x = simpleSim(x, 500, alleles=1:2)
examineKinships(x)

# Pretend we didn't know the brothers (3 and 6) were related
x1 = branch(x, 3)
x2 = branch(x, 6)
x2$famid = 2

# Notice the error: An 'unrelated' dot close to the sibling point
examineKinships(list(x1, x2))




