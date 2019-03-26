library(BoSSA)


### Name: sub_pplace
### Title: Subsets a pplace object
### Aliases: sub_pplace

### ** Examples


data(pplace)

### subsetting using placement ids. Here placements 1 to 5
sub1 <- sub_pplace(pplace,placement_id=1:5)
sub1

### subsetting using sequenes ids
id <- c("GWZHISEQ01:514:HMCLFBCXX:2:1108:1739:60356_90",
"GWZHISEQ01:514:HMCLFBCXX:2:1114:13665:31277_80")
sub2 <- sub_pplace(pplace,ech_id=id)
sub2

### subsetting using a regular expression of sequence ids
sub3 <- sub_pplace(pplace,ech_regexp="^HWI")
sub3



