library(Thresher)

# randomly generate data (reproducibly) with labels
set.seed(782345)
N <- 25
fix <- sample(LETTERS[1:3], N, replace=TRUE)
vary <- sample(LETTERS[4:6], N, replace=TRUE)

# make nuemeric versions of the same data
X <- as.numeric(factor(fix))
names(X) <- fix
table(X, names(X))
Y <- as.numeric(factor(vary))
names(Y) <- vary
table(Y, names(Y))

# check label matching (alphabetically)
chTable <- table(fix, vary)
chTable
matchLabels(chTable)
# final matching should be A <-> E (1 <- 2), B <-> F (2 <- 3), C <-> D (3 <- 1)

# check numerics
tab <- table(X, Y)
tab
matchLabels(tab)

# What we really want to is change the arbitrary labels
# in the "vary" assignments
# First, test the numeric version
S <- remap(X, Y)
table(Y, S) # map from Y to S is 1->3, 2->1, 3->2, as it shoul be
table(X, S)

# Next the character/factor version
R <- remap(fix, vary)
table(vary, R) # maps D->F, E->D, F->E
table(fix, R) # better diagnal than the original, shown next
table(fix, vary)
