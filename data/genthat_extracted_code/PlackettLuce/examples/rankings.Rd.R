library(PlackettLuce)


### Name: rankings
### Title: Rankings Object
### Aliases: rankings as.rankings as.rankings.default as.rankings.matrix
###   [.rankings format.rankings rbind.rankings

### ** Examples

# create rankings from data in long form
x <- data.frame(ranking = c(rep(1:4, each = 4), 5, 5, 5),
                letter = c(LETTERS[c(1:3, 3, 1:4, 2:5, 1:2, 1)], NA,
                           LETTERS[3:5]),
                rank = c(4:1, rep(NA, 4), 3:4, NA, NA, 1, 3, 4, 2, 2, 2, 3))
# ranking 1 has different rank for same item, but order of items unambiguous
# all ranks are missing in ranking 2
# some ranks are missing in ranking 3
# ranking 4 has inconsistent ranks for two items and a rank with missing item
# ranking 5 is fine - an example of a tie
split(x, x$ranking)
# fix issues when creating rankings object
rankings(x, id = "ranking", item = "letter", rank = "rank")

# convert existing matrix of rankings
R <- matrix(c(1, 2, 0, 0,
              4, 1, 2, 3,
              2, 1, 1, 1,
              1, 2, 3, 0,
              2, 1, 1, 0,
              1, 0, 3, 2), nrow = 6, byrow = TRUE)
colnames(R) <- c("apple", "banana", "orange", "pear")
R <- as.rankings(R)
# first three rankings
R[1:3,]
# exclude pear from the rankings
R[, -4]
# extract rankings 2 and 3 as numeric matrix
R[2:3, , as.rankings = FALSE]
# same as
unclass(R)[2:3,]
# extract rankings for item 1 as a vector
R[,1, as.rankings = FALSE]




