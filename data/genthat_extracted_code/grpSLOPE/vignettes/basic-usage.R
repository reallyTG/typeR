## ------------------------------------------------------------------------
set.seed(17082016)

p     <- 500
probs <- runif(p, 0.1, 0.5)
probs <- t(probs) %x% matrix(1,p,2)
X0    <- matrix(rbinom(2*p*p, 1, probs), p, 2*p)
X     <- X0 %*% (diag(p) %x% matrix(1,2,1))

## ---- results = "asis", echo = FALSE-------------------------------------
pander::pandoc.table(X[1:10, 1:10])

## ------------------------------------------------------------------------
group <- c(rep(1:20, each=3),
           rep(21:40, each=4),
           rep(41:60, each=5),
           rep(61:80, each=6),
           rep(81:100, each=7))
group <- paste0("grp", group)
str(group)

## ------------------------------------------------------------------------
# this generates a list containing a vector of indices for each group:
group.id <- grpSLOPE::getGroupID(group)
# this extracts the total number of groups:
n.group <- length(group.id)
# this vector collects the sizes of every group of predictors:
group.length <- sapply(group.id, FUN=length)
# this vector collects the group names:
group.names <- names(group.id)

## ------------------------------------------------------------------------
ind.relevant <- sort(sample(1:n.group, 10)) # indices of relevant groups

## ---- results = "asis", echo = FALSE-------------------------------------
pander::pandoc.table(group.names[ind.relevant])

## ------------------------------------------------------------------------
b <- rep(0, p)
for (j in ind.relevant) {
  b[group.id[[j]]] <- runif(group.length[j])
}

## ------------------------------------------------------------------------
y <- X %*% b + rnorm(p)

## ------------------------------------------------------------------------
library(grpSLOPE)

model <- grpSLOPE(X=X, y=y, group=group, fdr=0.1)

## ------------------------------------------------------------------------
model$selected

## ------------------------------------------------------------------------
sigma(model) # or equivalently: model$sigma

## ------------------------------------------------------------------------
# the first 13 coefficient estimates
coef(model)[1:13]

## ------------------------------------------------------------------------
# intercept and the first 13 coefficient estimates
coef(model, scaled = FALSE)[1:14]

## ------------------------------------------------------------------------
# true first 13 coefficients
b[1:13]

## ------------------------------------------------------------------------
plot(model$lambda[1:10], xlab = "Index", ylab = "Lambda", type="l")

## ---- results = "asis"---------------------------------------------------
true.relevant <- group.names[ind.relevant]
truepos       <- intersect(model$selected, true.relevant)

n.truepos  <- length(truepos)
n.selected <- length(model$selected)
n.falsepos <- n.selected - n.truepos

gFDP <- n.falsepos / max(1, n.selected)
pow <- n.truepos / length(true.relevant)

print(paste("gFDP =", gFDP))
print(paste("Power =", pow))

