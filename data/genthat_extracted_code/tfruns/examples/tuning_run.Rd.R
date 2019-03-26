library(tfruns)


### Name: tuning_run
### Title: Tune hyperparameters using training flags
### Aliases: tuning_run

### ** Examples

## Not run: 
##D library(tfruns)
##D 
##D runs <- tuning_run("mnist_mlp.R", flags = list(
##D   batch_size = c(64, 128),
##D   dropout1 = c(0.2, 0.3, 0.4),
##D   dropout2 = c(0.2, 0.3, 0.4)
##D ))
##D 
##D runs[order(runs$eval_acc, decreasing = TRUE), ]
##D 
## End(Not run)




