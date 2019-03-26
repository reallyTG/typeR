library(strataG)


### Name: as.data.frame.gtypes
### Title: Convert 'gtypes' To 'data.frame'
### Aliases: as.data.frame.gtypes as.data.frame,gtypes-method as.data.frame

### ** Examples

data(msats.g)

# with defaults (alleles in multiple columns, with ids and stratification)
df <- as.data.frame(msats.g)
str(df)

# one column per locus
onecol.df <- as.data.frame(msats.g, one.col = TRUE)
str(onecol.df)

# just the genotypes
genotypes.df <- as.data.frame(msats.g, one.col = TRUE, ids = FALSE, strata = FALSE)
str(genotypes.df)




