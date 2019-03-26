library(peptider)


### Name: libBuild
### Title: Build peptide library of k-length sequences according to
###   specified scheme
### Aliases: libBuild

### ** Examples

user_scheme <- data.frame(class=c("A", "B", "C", "Z"),
                          aacid=c("SLR", "AGPTV", "CDEFHIKMNQWY", "*"),
                          c=c(3,2,1,1))
user_library <- libBuild(3, user_scheme)



