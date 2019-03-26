library(MatchingFrontier)


### Name: estimateEffects
### Title: Estimate Effects on the Frontier
### Aliases: estimateEffects

### ** Examples

data(lalonde)

match.on <- colnames(lalonde)[!(colnames(lalonde) %in% c('re78',
                                'treat'))]

my.frontier <- makeFrontier(dataset = lalonde,
                            treatment = 'treat',
                            outcome = 're78',
                            match.on = match.on)

my.form <- as.formula(re78 ~ treat + age + black + education + hispanic +
                          married + nodegree + re74 + re75)
## Not run: 
##D my.estimates <- estimateEffects(my.frontier, 're78 ~ treat',
##D                                 mod.dependence.formula = my.form,
##D                                 continuous.vars = c('age', 'education', 're74', 're75'),
##D                                 prop.estimated = .1,
##D                                 means.as.cutpoints = TRUE)
## End(Not run)



