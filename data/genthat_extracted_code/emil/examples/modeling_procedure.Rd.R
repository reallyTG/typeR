library(emil)


### Name: modeling_procedure
### Title: Setup a modeling procedure
### Aliases: modeling_procedure

### ** Examples

# 1: Fit linear discriminants without tuning any parameter,
# since it has none
modeling_procedure("lda")

# 2: Tune random forest's `mtry` parameter, with 3 possible values
modeling_procedure("randomForest", list(mtry = list(100, 250, 1000)))

# 3: Tune random forest's `mtry` and `maxnodes` parameters simultaneously,
# with 3 values each, testing all 9 possible combinations
modeling_procedure("randomForest", list(mtry = list(100, 250, 1000),
                                        maxnodes = list(5, 10, 25)))

# 4: Tune random forest's `mtry` and `maxnodes` parameters simultaneously,
# but only test 3 manually specified combinations of the two
modeling_procedure("randomForest", list(list(mtry = 100, maxnodes = 5),
                                   list(mtry = 250, maxnodes = 10),
                                   list(mtry = 1000, maxnodes = 25)))

# 5: Tune elastic net's `alpha` and `lambda` parameters. Since elastic net's
# fitting function can tune `lambda` internally in a more efficient way
# than the general framework is able to do, only tune `alpha` and pass all
# `lambda` values as a single argument.
modeling_procedure("glmnet", list(alpha = seq(0, 1, length.out=6),
                                  lambda = list(seq(0, 5, length.out=30))))

# 6: Train elastic nets using the caret package's model fitting framework
if(requireNamespace("caret", quitely = TRUE)){
    modeling_procedure("caret", list(method = "glmnet",
        trControl = list(trainControl(verboseIter = TRUE, classProbs = TRUE))))
}




