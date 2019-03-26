library(psychotools)


### Name: paircomp
### Title: Data Structure for Paired Comparisons
### Aliases: paircomp length.paircomp c.paircomp [.paircomp rep.paircomp
###   xtfrm.paircomp as.character.paircomp as.data.frame.paircomp
###   as.double.paircomp as.integer.paircomp as.matrix.paircomp
###   covariates.paircomp covariates<-.paircomp labels.paircomp
###   labels<-.paircomp names.paircomp names<-.paircomp mscale.paircomp
###   mscale<-.paircomp str.paircomp summary.paircomp is.na.paircomp
### Keywords: classes

### ** Examples

## a simple paired comparison
pc <- paircomp(rbind(
  c(1,  1,  1), # a > b, a > c, b > c
  c(1,  1, -1), # a > b, a > c, b < c
  c(1, -1, -1), # a > b, a < c, b < c
  c(1,  1,  1)))

## basic methods
pc
str(pc)
summary(pc)
pc[2:3]
c(pc[2], pc[c(1, 4)])

## methods to extract/set attributes
labels(pc)
labels(pc) <- c("ah", "be", "ce")
pc
mscale(pc)
covariates(pc)
covariates(pc) <- data.frame(foo = factor(c(1, 2, 2), labels = c("foo", "bar")))
covariates(pc)
names(pc)
names(pc) <- LETTERS[1:4]
pc

## reorder() and subset() both select a subset of
## objects and/or reorders the objects
reorder(pc, c("ce", "ah"))


## include paircomp object in a data.frame
## (i.e., with subject covariates)
dat <- data.frame(
  x = rnorm(4),
  y = factor(c(1, 2, 1, 1), labels = c("hansi", "beppi")))
dat$pc <- pc
dat


## formatting with long(er) labels and extended scale
pc2 <- paircomp(rbind(
  c(4,  1,  0),
  c(1,  2, -1),
  c(1, -2, -1),
  c(0,  0,  -3)),
  labels = c("Nordrhein-Westfalen", "Schleswig-Holstein", "Baden-Wuerttemberg"))
## default: abbreviate
print(pc2)
print(pc2, abbreviate = FALSE)
print(pc2, abbreviate = FALSE, width = FALSE)


## paired comparisons with object covariates
pc3 <- paircomp(rbind(
  c(2,  1,  0),
  c(1,  1, -1),
  c(1, -2, -1),
  c(0,  0,  0)),
  labels = c("New York", "Rio", "Tokyo"),
  covariates = data.frame(hemisphere = factor(c(1, 2, 1), labels = c("North", "South"))))
covariates(pc3)



