library(fechner)


### Name: fechner
### Title: Main Function For Fechnerian Scaling
### Aliases: fechner
### Keywords: attribute classes manip models univar

### ** Examples

##
## (1) examples based on dataset morse
##

## dataset morse satisfies regular maximality in canonical form
morse
check.regular(morse, type = "percent.same")

## a self-contained 10-code subspace consisting of the codes for the
## letter B and the digits 0, 1, 2, 4, ..., 9
indices <- which(is.element(names(morse), c("B", c(0, 1, 2, 4:9))))
f.scal.morse <- fechner(morse, format = "percent.same")
f.scal.morse$geodesic.loops[indices, indices]
morse.subspace <- morse[indices, indices]
check.regular(morse.subspace, type = "percent.same")

## since the subspace is self-contained, results must be the same
f.scal.subspace.mo <- fechner(morse.subspace, format = "percent.same")
identical(f.scal.morse$geodesic.loops[indices, indices],
          f.scal.subspace.mo$geodesic.loops)
identical(f.scal.morse$overall.Fechnerian.distances[indices, indices],
          f.scal.subspace.mo$overall.Fechnerian.distances)

## Fechnerian scaling analysis using short computation
f.scal.subspace.mo
str(f.scal.subspace.mo)
attributes(f.scal.subspace.mo)
## for instance, the S-index
f.scal.subspace.mo$S.index

## Fechnerian scaling analysis using long computation
f.scal.subspace.long.mo <- fechner(morse.subspace,
                                   format = "percent.same",
                                   compute.all = TRUE,
                                   check.computation = TRUE)
f.scal.subspace.long.mo
str(f.scal.subspace.long.mo)
attributes(f.scal.subspace.long.mo)
## for instance, the geodesic chains of the first kind
f.scal.subspace.long.mo$geodesic.chains.1

## check whether the overall Fechnerian distance of the first kind is
## equal to the overall Fechnerian distance of the second kind
## the difference, by theory a zero matrix
f.scal.subspace.long.mo$check[1]
## or, up to machine precision
f.scal.subspace.long.mo$check[2]

## plot of the S-index versus the overall Fechnerian distance
## for all (off-diagonal) pairs of stimuli
plot(f.scal.subspace.long.mo)
## for all (off-diagonal) pairs of stimuli with geodesic loops
## containing at least 3 links
plot(f.scal.subspace.long.mo, level = 3)

## corresponding summaries, including Pearson correlation and C-index
summary(f.scal.subspace.long.mo)
## in particular, accessing detailed summary through assignment
detailed.summary.mo <- summary(f.scal.subspace.long.mo, level = 3)
str(detailed.summary.mo)

##
## (2) examples based on dataset wish
##

## dataset wish satisfies regular minimality in canonical form
wish
check.regular(wish, type = "probability.different")

## a self-contained 10-code subspace consisting of S, U, W, X,
## 0, 1, ..., 5
indices <- which(is.element(names(wish), c("S", "U", "W", "X", 0:5)))
f.scal.wish <- fechner(wish, format = "probability.different")
f.scal.wish$geodesic.loops[indices, indices]
wish.subspace <- wish[indices, indices]
check.regular(wish.subspace, type = "probability.different")

## since the subspace is self-contained, results must be the same
f.scal.subspace.wi <- fechner(wish.subspace,
                              format = "probability.different")
identical(f.scal.wish$geodesic.loops[indices, indices],
          f.scal.subspace.wi$geodesic.loops)
identical(f.scal.wish$overall.Fechnerian.distances[indices, indices],
          f.scal.subspace.wi$overall.Fechnerian.distances)

## dataset wish transformed to percent-same format
check.data(100 - (wish * 100), format = "percent.same")

## Fechnerian scaling analysis using short computation
f.scal.subspace.wi
str(f.scal.subspace.wi)
attributes(f.scal.subspace.wi)
## for instance, the graph-theoretic lengths of geodesic loops
f.scal.subspace.wi$graph.lengths.of.geodesic.loops

## Fechnerian scaling analysis using long computation
f.scal.subspace.long.wi <- fechner(wish.subspace,
                                   format = "probability.different",
                                   compute.all = TRUE,
                                   check.computation = TRUE)
f.scal.subspace.long.wi
str(f.scal.subspace.long.wi)
attributes(f.scal.subspace.long.wi)
## for instance, the oriented Fechnerian distances of the first kind
f.scal.subspace.long.wi$oriented.Fechnerian.distances.1
## or, graph-theoretic lengths of chains and loops
identical(f.scal.subspace.long.wi$graph.lengths.of.geodesic.chains.1 +
          t(f.scal.subspace.long.wi$graph.lengths.of.geodesic.chains.1),
          f.scal.subspace.long.wi$graph.lengths.of.geodesic.loops.1)

## overall Fechnerian distances are not monotonically related to
## discrimination probabilities; however, there is a strong positive
## correlation
cor(as.vector(f.scal.wish$overall.Fechnerian.distances),
    as.vector(as.matrix(wish)))

## check whether the overall Fechnerian distance of the first kind is
## equal to the overall Fechnerian distance of the second kind
## the difference, by theory a zero matrix
f.scal.subspace.long.wi$check[1]
## or, up to machine precision
f.scal.subspace.long.wi$check[2]

## plot of the S-index versus the overall Fechnerian distance
## for all (off-diagonal) pairs of stimuli
plot(f.scal.subspace.long.wi)
## for all (off-diagonal) pairs of stimuli with geodesic loops
## containing at least 5 links
plot(f.scal.subspace.long.wi, level = 5)

## corresponding summaries, including Pearson correlation and C-index
summary(f.scal.subspace.long.wi)
## in particular, accessing detailed summary through assignment
detailed.summary.wi <- summary(f.scal.subspace.long.wi, level = 5)
str(detailed.summary.wi)



