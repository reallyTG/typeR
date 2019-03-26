library(psychotools)


### Name: summary.itemresp
### Title: Summarizing and Visualizing Item Response Data
### Aliases: summary.itemresp plot.itemresp
### Keywords: classes

### ** Examples

## summary/visualization for verbal aggression data
data("VerbalAggression", package = "psychotools")
r <- itemresp(VerbalAggression$resp[, 1:6])
mscale(r) <- c("no", "perhaps", "yes")
summary(r)
plot(r)

## modify formatting of mscale
summary(r, abbreviate = 1)
summary(r, mscale = FALSE)

## illustration for varying mscale across items
## merge with additional random binary response
b <- itemresp(rep(c(-1, 1), length.out = length(r)),
  mscale = c(-1, 1), labels = "Dummy")
rb <- merge(r[, 1:2], b)
head(rb, 2)
## summary has NAs for non-existent response categories
summary(rb)
summary(rb, mscale = FALSE)
plot(rb, srt = 25)
plot(rb, mscale = FALSE)



