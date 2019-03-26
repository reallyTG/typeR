library(hhh4contacts)


### Name: noroBE
### Title: Create '"sts"' Objects from the Berlin Norovirus Data
### Aliases: noroBE counts map
### Keywords: datasets

### ** Examples

## the raw data
str(counts)
summary(map)

## district-specific time series
noroBEr <- noroBE(by = "districts")
plot(noroBEr)

## age group-specific time series
noroBEg <- noroBE(by = "agegroups")
plot(noroBEg)

## list of spatio-temporal surveillance counts, one for each age group
noroBErbyg <- noroBE(by = "all", flatten = FALSE)
plot(noroBErbyg[[1L]], par.list = list(oma=c(0,0,2,0)))
title(main = names(noroBErbyg)[1], outer = TRUE, line = -1)

## flattened "sts" object (the 'neighbourhood' only reflects spatial info)
noroBEall <- noroBE(by = "all", flatten = TRUE)
dev.new(width = 16, height = 7)
plot(noroBEall, par.list = list(
    xaxt = "n", mar = c(1,4,1,1), mfrow = c(ncol(noroBEg), ncol(noroBEr))
))



