library(nsga3)


### Name: nsga3fs
### Title: NSGA III for Multi-Objective Feature Selection
### Aliases: nsga3fs

### ** Examples

xgb_learner <- mlr::makeLearner("classif.xgboost", predict.type = "prob",
                            par.vals = list(
                            objective = "binary:logistic",
                            eval_metric = "error",nrounds = 2))

rsmp <- mlr::makeResampleDesc("CV", iters = 2)
measures <- list(mlr::mmce)

f_auc <- function(pred){auc <- mlr::performance(pred, auc)
                        return(as.numeric(auc))}
objective <- c(f_auc)
o_names <- c("AUC", "nf")
par <- rPref::high(AUC)*rPref::low(nf)

nsga3fs(df = german_credit, target = "BAD", obj_list = objective,
        obj_names = o_names, pareto = par, pop_size = 1, max_gen = 1,
        model = xgb_learner, resampling = rsmp,
        num_features = TRUE, r_measures = measures, cpus = 2)








