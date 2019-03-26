library(psychotools)


### Name: itemresp
### Title: Data Structure for Item Response Data
### Aliases: itemresp is.na.itemresp labels.itemresp labels<-.itemresp
###   length.itemresp levels.itemresp mscale.itemresp mscale<-.itemresp
###   names.itemresp names<-.itemresp rep.itemresp str.itemresp
###   xtfrm.itemresp
### Keywords: classes

### ** Examples

## binary responses to three items, coded as matrix
x <- cbind(c(1, 0, 1, 0), c(1, 0, 0, 0), c(0, 1, 1, 1))
## transformed to itemresp object
xi <- itemresp(x)

## printing (see also ?print.itemresp)
print(xi)
print(xi, labels = TRUE)

## subsetting/indexing (see also ?subset.itemresp)
xi[2]
xi[c(TRUE, TRUE, FALSE, FALSE)]
subset(xi, items = 1:2)
dim(xi)
length(xi)

## summary/visualization (see also ?summary.itemresp)
summary(xi)
plot(xi)

## query/set measurement scale labels
## extract mscale (tries to collapse to vector)
mscale(xi)
## extract as list
mscale(xi, simplify = FALSE)
## replacement by list
mscale(xi) <- list(item1 = c("no", "yes"),
  item2 = c("nay", "yae"), item3 = c("-", "+"))
xi
mscale(xi)
## replacement with partially named list plus default
mscale(xi) <- list(item1 = c("n", "y"), 0:1)
mscale(xi)
## replacement by vector (if number of categories constant)
mscale(xi) <- c("-", "+")
mscale(xi, simplify = FALSE)

## query/set item labels and subject names
labels(xi)
labels(xi) <- c("i1", "i2", "i3")
names(xi)
names(xi) <- c("John", "Joan", "Jen", "Jim")
print(xi, labels = TRUE)

## coercion (see also ?as.list.itemresp)
## to integer matrix
as.matrix(xi)
## to data frame with single itemresp column
as.data.frame(xi)
## to list of factors
as.list(xi)
## to data frame with factors
as.list(xi, df = TRUE)


## polytomous responses with missing values and unequal number of
## categories in a data frame
d <- data.frame(
  q1 = c(-2, 1, -1, 0, NA, 1, NA),
  q2 = c(3, 5, 2, 5, NA, 2, 3),
  q3 = factor(c(1, 2, 1, 2, NA, 3, 2), levels = 1:3,
    labels = c("disagree", "neutral", "agree")))
di <- itemresp(d)
di

## auto-completion of mscale: full range (-2, ..., 2) for q1, starting
## from smallest observed (negative) value (-2) to the same (positive)
## value (2), full (positive) range for q2, starting from smallest
## observed value (2) to largest observed value (5), missing category of
## 4 is detected, for q3 given factor levels are used
mscale(di)

## set mscale for q2 and add category 1, q1 and q3 are auto-completed:
di <- itemresp(d, mscale = list(q2 = 1:5))

## is.na.itemresp - only true for observation 5 (all missing)
is.na(di)

## illustration for larger data set
data("VerbalAggression", package = "psychotools")
r <- itemresp(VerbalAggression$resp[, 1:12])
str(r)
head(r)
plot(r)
summary(r)
prop.table(summary(r), 1)

## dichotomize response
r2 <- r
mscale(r2) <- c(0, 1, 1)
plot(r2)

## transform to "likert" package
if(require("likert")) {
lik <- likert(as.data.frame(as.list(r)))
lik
plot(lik)
}



