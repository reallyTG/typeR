library(qtl)


### Name: addmarker
### Title: Add a marker to a cross
### Aliases: addmarker
### Keywords: utilities

### ** Examples

data(fake.f2)

# genotypes for new marker
gi <- pull.geno(fill.geno(fake.f2))[,"D5M197"]

# add marker to cross
fake.f2 <- addmarker(fake.f2, gi, "D5M197imp", "5", 11)



