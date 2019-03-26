library(cutpointr)


### Name: cutpointr
### Title: Determine and evaluate optimal cutpoints
### Aliases: cutpointr cutpointr.default cutpointr.numeric

### ** Examples

library(cutpointr)

## Optimal cutpoint for dsi
data(suicide)
opt_cut <- cutpointr(suicide, dsi, suicide)
opt_cut
summary(opt_cut)
plot(opt_cut)

## Not run: 
##D ## Predict class for new observations
##D predict(opt_cut, newdata = data.frame(dsi = 0:5))
##D 
##D ## Supplying raw data, same result
##D cutpointr(x = suicide$dsi, class = suicide$suicide)
##D 
##D ## direction, class labels, method and metric can be defined manually
##D ## Again, same result
##D cutpointr(suicide, dsi, suicide, direction = ">=", pos_class = "yes",
##D           method = maximize_metric, metric = youden)
##D 
##D ## Optimal cutpoint for dsi, as before, but for the separate subgroups
##D opt_cut <- cutpointr(suicide, dsi, suicide, gender)
##D opt_cut
##D 
##D ## Bootstrapping also works on individual subgroups
##D ## low boot_runs for illustrative purposes
##D set.seed(30)
##D opt_cut <- cutpointr(suicide, dsi, suicide, gender, boot_runs = 5)
##D opt_cut
##D summary(opt_cut)
##D plot(opt_cut)
##D 
##D ## Transforming variables (unrealistic, just to show the functionality)
##D opt_cut <- cutpointr(suicide, x = log(dsi + 1), class = suicide == "yes",
##D     subgroup = dsi %% 2 == 0)
##D opt_cut
##D predict(opt_cut, newdata = data.frame(dsi = 1:3))
##D 
##D ## Parallelized bootstrapping
##D   cl <- makeCluster(2) # 2 cores
##D   registerDoParallel(cl)
##D   registerDoRNG(12) # Reproducible parallel loops using doRNG
##D   opt_cut <- cutpointr(suicide, dsi, suicide, gender,
##D                        boot_runs = 10, allowParallel = TRUE)
##D   stopCluster(cl)
##D   opt_cut
##D   plot(opt_cut)
##D 
##D ## Robust cutpoint method using kernel smoothing for optimizing Youden-Index
##D opt_cut <- cutpointr(suicide, dsi, suicide, gender,
##D                      method = oc_youden_kernel)
##D opt_cut
## End(Not run)






