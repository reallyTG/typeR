library(tbltools)


### Name: tabsort
### Title: tabsort
### Aliases: tabsort ntbl

### ** Examples


## generate example data
x <- sample(letters[1:4], 200, replace = TRUE)
y <- sample(letters[5:8], 200, replace = TRUE)

## count and sort frequencies for each vector
tabsort(x)
tabsort(y)

## combine x and y into data frame
dat <- data.frame(x, y)

## select columns and create freq table
tabsort(dat, x)
tabsort(dat, x, y)




