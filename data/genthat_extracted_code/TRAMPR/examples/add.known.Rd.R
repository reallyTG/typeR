library(TRAMPR)


### Name: add.known
### Title: Add Knowns To TRAMPknowns Databases
### Aliases: add.known add.known.TRAMP add.known.TRAMPknowns combine.TRAMP
###   combine.TRAMPknowns
### Keywords: manip

### ** Examples

data(demo.knowns)
data(demo.samples)

## (1) Using add.known(), to add a single known:

## Sample "101" looks like a potential known, add it to our knowns
## database:
plot(demo.samples, 101)

## Add this to a knowns database:
## Because there is more than one peak per enzyme/primer combination, a
## warning will be given.  In this case, since there are clear peaks it
## is harmless.
demo.knowns.2 <- add.known(demo.knowns, demo.samples, 101,
                           prompt=FALSE)

## The known has been added:
demo.knowns.2[101]
try(demo.knowns[101]) # error - known didn't exist in original knowns

## Same, but adding to an existing TRAMP object.
res <- TRAMP(demo.samples, demo.knowns)
plot(res, 101)
res2 <- add.known(res, 101, prompt=FALSE, default.species="New known")

## Now the new known matches itself.
plot(res2, 101)

## (2) Using combine() to combine knowns databases.

## Let's split the original knowns database in two:
demo.knowns.a <- demo.knowns[head(labels(demo.knowns), 10)]
demo.knowns.b <- demo.knowns[tail(labels(demo.knowns), 10)]

## Combining these is easy:
demo.knowns.c <- combine(demo.knowns.a, demo.knowns.b)

## Knowns from both the small database are present in the new one:
identical(c(labels(demo.knowns.a), labels(demo.knowns.b)),
          labels(demo.knowns.c))


## Demonstration of knowns rewriting:
demo.knowns.d <- demo.knowns.a
demo.knowns.a$info$from <- "a"
demo.knowns.d$info$from <- "d"

try(combine(demo.knowns.a, demo.knowns.d)) # error
demo.knowns.e <- combine(demo.knowns.a, demo.knowns.d,
                         rewrite.knowns.pk=TRUE)

## See that both data sets are here (check the "from" column).
demo.knowns.e$info

## Note that a better approach in might be to manually resolve
## conficting knowns.pk values before combining.



