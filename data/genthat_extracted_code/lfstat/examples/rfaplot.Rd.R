library(lfstat)


### Name: rfaplot
### Title: Regional Frequency Analysis
### Aliases: rfaplot
### Keywords: Regional Frequency Analysis lmom

### ** Examples

data(ngaruroro)

#Toy example to get some more "rivers"
seventies <- subset(ngaruroro, hyear %in% 1970:1979)
eighties <- subset(ngaruroro, hyear %in% 1980:1989)
nineties <- subset(ngaruroro, hyear %in% 1990:1999)

rfaplot(list(seventies,eighties,nineties), n=3)



