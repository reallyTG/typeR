library(rgr)


### Name: gx.subset
### Title: Extracts a Subset of Rows from a Data Frame
### Aliases: gx.subset
### Keywords: misc

### ** Examples

## Make test data available
data(kola.c)

## Make a subset of the data for Finland
finland.c <- gx.subset(kola.c, COUNTRY == "FIN")

## Make a subset of the data for rock type, LITHO 82 occurring
## in Russia. Note that both COUNTRY and LITHO are factor variables 
russia.82 <- gx.subset(kola.c, COUNTRY == "RUS" & LITHO == 82)

## Make a subset of the data for Cu exceeding 50(ppm) in Norway
norway.cugt50 <- gx.subset(kola.c, COUNTRY == "NOR" & Cu >50)

## Make single element subsets, e.g. for use with function gx.cnpplts
## First locate the column in the data frame where the element of
## interest is stored using dimnames(kola.c)[[2]], we find that Be is
## the 19th column in the data frame
dimnames(kola.c)[[2]]
Norway <- gx.subset(kola.c,COUNTRY=="NOR")[,19]
Russia <- gx.subset(kola.c,COUNTRY=="RUS")[,19]
Finland <- gx.subset(kola.c,COUNTRY=="FIN")[,19]

## Clean-up
rm(finland.c)
rm(russia.82)
rm(norway.cugt50)
rm(Norway)
rm(Russia)
rm(Finland)



