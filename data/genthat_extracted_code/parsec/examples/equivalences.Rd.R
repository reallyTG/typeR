library(parsec)


### Name: equivalences
### Title: Equivalence classes in a poset.
### Aliases: equivalences equivalences.cover equivalences.incidence

### ** Examples

Lmbd <- getlambda(A > B, A > C, B > D, A > E, B > E, C > F, C > G)
res <- equivalences(Lmbd)

equivalence_classes <- levels(res)
colrs <- sapply(res, function(x) which(equivalence_classes == x)) + 1
plot(Lmbd, col = colrs, lwd = 2)



