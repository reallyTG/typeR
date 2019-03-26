library(exreport)


### Name: expCreateFromTable
### Title: Create an exreport experiment from a tabular representation
### Aliases: expCreateFromTable

### ** Examples

# We generate a data frame where the methods are rows and the problems columns
# from the wekaExperiment problem. (This is only an example, normally you
# would prefer to load a proper experiment and process it.)

library(reshape2)
df <- dcast(wekaExperiment[wekaExperiment$featureSelection=="no",],
method ~ problem,
value.var="accuracy",
fun.aggregate = mean)

# We can create it and parametrice accordingly:
expCreateFromTable(df, output="accuracy", name="weka")

# Optionally we can set a fixed value for parameters, and ordered by appearance:
expCreateFromTable(df, output="accuracy", name="weka",
parameters=list(featureSelection = "no"), respectOrder=TRUE)



