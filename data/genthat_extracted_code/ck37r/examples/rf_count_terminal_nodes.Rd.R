library(ck37r)


### Name: rf_count_terminal_nodes
### Title: Count the terminal nodes in each tree from a random forest
### Aliases: rf_count_terminal_nodes

### ** Examples


library(SuperLearner)
library(ck37r)

data(Boston, package = "MASS")

set.seed(1)

# Downsample to 100 observations speed up example.
Boston = Boston[sample(nrow(Boston), 100L), ]

sl = SuperLearner(Boston$medv, subset(Boston, select = -medv), family = gaussian(),
                 cvControl = list(V = 3),
                 SL.library = c("SL.mean", "SL.glmnet", "SL.randomForest"))

sl

summary(rf_count_terminal_nodes(sl$fitLibrary$SL.randomForest_All$object))

max_terminal_nodes = max(rf_count_terminal_nodes(sl$fitLibrary$SL.randomForest_All$object))

max_terminal_nodes

# Now run create.Learner() based on that maximum.

# It is often handy to convert to log scale of a hyperparameter before testing a ~linear grid.
# NOTE: -0.7 ~ 0.69 ~ log(0.5) which is the multiplier that yields sqrt(max)
maxnode_seq = unique(round(exp(log(max_terminal_nodes) * exp(c(-0.97, -0.7, -0.45, -0.15, 0)))))
maxnode_seq

rf = SuperLearner::create.Learner("SL.randomForest", detailed_names = TRUE, name_prefix = "rf",
                                 params = list(ntree = 100), # fewer trees for testing speed only.
                                 tune = list(maxnodes = maxnode_seq))

sl = SuperLearner(Boston$medv, subset(Boston, select = -medv), family = gaussian(),
                 cvControl = list(V = 3),
                 SL.library = c("SL.mean", "SL.glmnet", rf$names))

sl




