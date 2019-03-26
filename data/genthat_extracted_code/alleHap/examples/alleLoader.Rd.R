library(alleHap)


### Name: alleLoader
### Title: Data loading of nuclear families (in .ped format)
### Aliases: alleLoader

### ** Examples


## Loading of a dataset in .ped format with alphabetical alleles (A,C,G,T)
example1 <- file.path(find.package("alleHap"), "examples", "example1.ped")
example1Alls <- alleLoader(example1)
head(example1Alls)

## Loading of a dataset in .ped format with numerical alleles
example2 <- file.path(find.package("alleHap"), "examples", "example2.ped")
example2Alls <- alleLoader(example2)
head(example2Alls)




