library(bibliometrix)


### Name: Hindex
### Title: h-index calculation
### Aliases: Hindex

### ** Examples


### EXAMPLE 1: ###
 
data(scientometrics)

authors <- c("SMALL H", "CHEN DZ")

Hindex(scientometrics, field = "author", elements = authors, sep = ";")$H

Hindex(scientometrics, field = "source", elements = "SCIENTOMETRICS", sep = ";")$H

### EXAMPLE 2: Garfield h-index###
 
data(garfield)

indices=Hindex(garfield, field = "author", elements = "GARFIELD E", , sep = ";")

# h-index, g-index and m-index of Eugene Garfield
indices$H

# Papers and total citations
indices$CitationList[[1]]




