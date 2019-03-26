library(exreport)


### Name: expCombine
### Title: Combine two experiments with different outputs
### Aliases: expCombine

### ** Examples

# In this example we turn the wekaExperiment into two different experiments,
# with different outputs to combine them:

df_acc  <- wekaExperiment[,
           c("method", "problem", "fold", "featureSelection", "accuracy")]
df_time <- wekaExperiment[,
           c("method", "problem", "fold", "featureSelection", "trainingTime")]

exp_acc <- expCreate(df_acc, name="acc", parameter="fold")
exp_time <- expCreate(df_time, name="time", parameter="fold")

# With expCombine we can mix the two experiments:
expCombine(exp_acc, exp_time)



