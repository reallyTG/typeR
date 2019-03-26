library(poppr)


### Name: missingno
### Title: Treat missing data
### Aliases: missingno

### ** Examples


data(nancycats)

nancy.locina <- missingno(nancycats, type = "loci")

## Found 617 missing values.
## 2 loci contained missing values greater than 5%.
## Removing 2 loci : fca8 fca45 

nancy.genona <- missingno(nancycats, type = "geno")

## Found 617 missing values.
## 38 genotypes contained missing values greater than 5%.
## Removing 38 genotypes : N215 N216 N188 N189 N190 N191 N192 N302 N304 N310 
## N195 N197 N198 N199 N200 N201 N206 N182 N184 N186 N298 N299 N300 N301 N303 
## N282 N283 N288 N291 N292 N293 N294 N295 N296 N297 N281 N289 N290  

# Replacing all NA with "0" (see tab in the adegenet package).
nancy.0 <- missingno(nancycats, type = "0")

## Replaced 617 missing values 

# Replacing all NA with the mean of each column (see tab in the
# adegenet package).
nancy.mean <- missingno(nancycats, type = "mean")

## Replaced 617 missing values 



