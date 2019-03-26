library(caret)


### Name: safs_initial
### Title: Ancillary simulated annealing functions
### Aliases: safs_initial safs_perturb safs_prob caretSA rfSA treebagSA
### Keywords: datasets

### ** Examples


selected_vars <- safs_initial(vars = 10 , prob = 0.2)
selected_vars

###

safs_perturb(selected_vars, vars = 10, number = 1)

###

safs_prob(old = .8, new = .9, iteration = 1)
safs_prob(old = .5, new = .6, iteration = 1)

grid <- expand.grid(old = c(4, 3.5),
                    new = c(4.5, 4, 3.5) + 1,
                    iter = 1:40)
grid <- subset(grid, old < new)

grid$prob <- apply(grid, 1,
                   function(x)
                     safs_prob(new = x["new"],
                               old= x["old"],
                               iteration = x["iter"]))

grid$Difference <- factor(grid$new - grid$old)
grid$Group <- factor(paste("Current Value", grid$old))

ggplot(grid, aes(x = iter, y = prob, color = Difference)) +
  geom_line() + facet_wrap(~Group) + theme_bw() +
  ylab("Probability") + xlab("Iteration")

## Not run: 
##D ###
##D ## Hypothetical examples
##D lda_sa <- safs(x = predictors,
##D                y = classes,
##D                safsControl = safsControl(functions = caretSA),
##D                ## now pass arguments to `train`
##D                method = "lda",
##D                metric = "Accuracy"
##D                trControl = trainControl(method = "cv", classProbs = TRUE))
##D 
##D rf_sa <- safs(x = predictors,
##D               y = classes,
##D               safsControl = safsControl(functions = rfSA),
##D               ## these are arguments to `randomForest`
##D               ntree = 1000,
##D               importance = TRUE)
##D 	
## End(Not run)






