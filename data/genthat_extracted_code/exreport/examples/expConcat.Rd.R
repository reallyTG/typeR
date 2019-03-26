library(exreport)


### Name: expConcat
### Title: Concatenate rows of matching experiments
### Aliases: expConcat

### ** Examples

# In this example we turn the wekaExperiment into two different experiments,
# with different parameter values to combine them:

df_no  <- wekaExperiment[wekaExperiment$featureSelection=="no",]
df_yes <- wekaExperiment[wekaExperiment$featureSelection=="yes",]

exp_yes <- expCreate(df_yes, name="fss-yes", parameter="fold")
exp_no <- expCreate(df_no, name="fss-no", parameter="fold")

expConcat(exp_yes, exp_no)



