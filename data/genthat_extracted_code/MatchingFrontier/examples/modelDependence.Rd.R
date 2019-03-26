library(MatchingFrontier)


### Name: modelDependence
### Title: Compute the Athey-Imbens measure of sensitivity to model
###   specification.
### Aliases: modelDependence

### ** Examples

data(lalonde)

treatment <- 'treat'
base.form <- as.formula('re78 ~ treat + age + education
                         + black + hispanic + married +
                         nodegree + re74 + re75')

md <- modelDependence(lalonde, treatment, base.form,
                      cutpoints = list('age' = mean(lalonde$age)))
print(md)



