library(relations)


### Name: scores
### Title: Relation Scores
### Aliases: relation_scores relation_scores.relation
###   relation_scores.relation_ensemble
### Keywords: math

### ** Examples

## Example taken from Cook and Cress (1992, p.74)
I <- matrix(c(0, 0, 1, 1, 1,
              1, 0, 0, 0, 1,
              0, 1, 0, 0, 1,
              0, 1, 1, 0, 0,
              0, 0, 0, 1, 0),
            ncol = 5,
            byrow = TRUE)
R <- relation(domain = letters[1:5], incidence = I)

## Note that this is a "preference matrix", so take complement:
R <- !R

## Compare Kendall and Wei scores
cbind(
      Kendall = relation_scores(R, method = "Kendall", normalize = TRUE),
      Wei = relation_scores(R, method = "Wei", normalize = TRUE)
     )

## Example taken from Cook and Cress (1992, p.136)
## Note that the results indicated for the Copeland scores have
## (erroneously?) been computed from the *unweighted* votes.
## Also, they report the votes as strict preferences, so we
## create the dual relations.

D <- letters[1:5]
X <- as.relation(ordered(D, levels = c("b", "c", "a", "d", "e")))
Y <- as.relation(ordered(D, levels = c("d", "a", "e", "c", "b")))
Z <- as.relation(ordered(D, levels = c("e", "c", "b", "a", "d")))
E <- relation_ensemble(X, Y, Z)
relation_scores(E, "Copeland")
relation_scores(E, "Borda", weights = c(4, 3, 2))



