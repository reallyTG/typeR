library(relations)


### Name: consensus
### Title: Consensus Relations
### Aliases: relation_consensus
### Keywords: math

### ** Examples

## Consensus equivalence.
## (I.e., in fact, consensus partition.)
## Classification of 30 felines, see Marcotorchino and Michaud (1982).
data("Felines")
## Consider each variable an equivalence relation on the objects.
relations <- as.relation_ensemble(Felines)
## This gives a relation ensemble of length 14 (number of variables in
## the data set).
## Now fit an equivalence relation to this:
E <- relation_consensus(relations, "symdiff/E")
## And look at the equivalence classes:
ids <- relation_class_ids(E)
## Or, more nicely:
split(rownames(Felines), ids)
## Which is the same as in the paper ...

## Consensus linear order.
## Example from Cook and Kress, pages 48ff.
## Relation from paired comparisons.
pm <- matrix(c(0, 1, 0, 1, 1,
               0, 0, 0, 1, 1,
               1, 1, 0, 0, 0,
               0, 0, 1, 0, 0,
               0, 0, 1, 1, 0),
             nrow = 5,
             byrow = TRUE,
             dimnames = list(letters[1:5], letters[1:5]))
## Note that this is a Cook and Kress "preference matrix" where entry
## (i,j) is one iff object i is preferred to object j (i > j).
## Set up the corresponding '<' relation:
R <- as.relation(t(pm))
relation_incidence(R)
relation_is(R, "tournament")
## Closest linear order:
L <- relation_consensus(R, "symdiff/L")
relation_incidence(L)
## Visualize provided that Rgraphviz is available.
if(require("Rgraphviz")) plot(L)
## But note that this linear order is not unique.
L <- relation_consensus(R, "symdiff/L", control = list(n = "all"))
print(L)
if(require("Rgraphviz")) plot(L)
## (Oh no: c is once first and once last.)
## Closest weak order relation with at most 3 indifference classes:
W3 <- relation_consensus(R, "symdiff/W", control = list(k = 3))
relation_incidence(W3)

## Consensus weak orders.
## Example from Emond and Mason, pages 28f.
## The reference provides 21 partial rankings of 15 objects,
## in 3 groups of 7 rankings (corresponding to three different
## ranking criteria) with respective weights 4, 5, and 7.
wei <- rep.int(c(4, 5, 7), rep(7, 3))
## The rankings are written by listing the object labels from the
## best to the worst, with a leading minus indicating a tie with
## the previous object:
EM_inputs <-
    c("6 1 -7 -9 10 3 8 11 5 -12 2 -4 -13",
      "6 10 9 3 4 -8 7 1 -5 -11 2 12 13 14 15",
      "6 10 3 7 8 11 5 14 15 12 1 -4 -13 2 -9",
      "6 9 -11 10 3 14 12 7 4 5 2 1 8 13 15",
      "10 6 7 1 11 -13 4 2 3 9 12 14 -15 8 5",
      "6 9 8 -10 11 4 1 5 7 15 2 12 14 13 3",
      "1 -6 -10 7 -12 9 3 4 -11 -14 -15 2 -13 8",
      "4 -10 1 -7 6 -9 -13 5 -14 3 12 8 11 -15 2",
      "4 -9 5 1 14 11 8 3 6 2 -13 10 12 7 15",
      "4 2 -5 8 15 7 11 -14 1 -12 -13 10 9 6",
      "2 -11 -12 -14 -15 6 -13 3 -4 9 8 -10 1 -5 -7",
      "4 14 10 2 5 3 1 13 12 7 15 8 11 6 9",
      "4 2 5 1 15 7 13 14 3 -12 8 11 6 9 10",
      "12 1 3 -4 2 11 -13 -15 9 14 6 8 7 -10 5",
      "5 4 9 2 -7 14 8 -11 3 1 15 12 6 10 13",
      "11 9 -14 15 12 3 4 13 8 6 7 10 5",
      "12 11 2 1 3 9 8 10 13 -14 6 4 -15 5 7",
      "4 -5 10 -12 3 8 -11 6 -7 -9 13 14 15",
      "12 5 -13 14 3 8 15 4 9 -10 11 6 7",
      "4 -5 -8 11 6 14 7 1 -2 -15 10 3 13 9 -12",
      "10 8 5 -11 6 -14 9 4 -13 -15 3 -12 2 1")
## Using the Emond-Mason paired comparison dissimilarity, there
## are three consensus rankings when using the above weights:
EM_solutions <-
    c("4 10 5-11 1 -2-14 3-12 9 8 6 7 13-15",
      "4 10 5-11 1 -2 9 14 3-12 8 6 7 13-15",
      "4 10 5-11 2-14 1 3-12 9 8 6 7 13-15")
## We can reproduce this as follows.
## We first provide a reader for the rankings, and a maker for
## creating the (possibly partial) ranking with the appropriate
## domain:
reader <- function(s) {
    strsplit(unlist(strsplit(gsub(" *-", "-", s),
                             " +")),
             "-",
             fixed = TRUE)
}
maker <- function(s) {
    ranking(lapply(reader(s), as.numeric),
            domain = as.numeric(1 : 15))
}
EM_inputs <- lapply(EM_inputs, maker)
EM_solutions <- lapply(EM_solutions, maker)
## Package 'relations' uses NA for non-diagonal incidences
## featuring unranked objects.
## Following the reference, we impute these by zeroes:
ens <- relation_impute(relation_ensemble(list = EM_inputs), "omit")
## We can now obtain all consensus weak orders (corresponding to
## complete rankings) as follows:
con <- relation_consensus(ens, "PC/W", wei, delta = "EM", all = TRUE)
## To verify that these agree with the solutions given in the
## reference:
sets::set_outer(con, relation_ensemble(list = EM_solutions), `==`)



