library(funique)


### Name: funique
### Title: A faster unique function
### Aliases: funique

### ** Examples


## create example data set
d <- data.frame(
  x = rnorm(1000),
  y = seq.POSIXt(as.POSIXct("2018-01-01"),
    as.POSIXct("2018-12-31"), length.out = 10)
)

## sample to create version with duplicates
dd <- d[c(1:1000, sample(1:1000, 500, replace = TRUE)), ]

## get only unique rows
head(funique(dd))

## check output
identical(unique(dd), funique(dd))




