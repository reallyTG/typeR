library(MatchingFrontier)


### Name: plotEstimates
### Title: Plot estimates along the frontier.
### Aliases: plotEstimates

### ** Examples

data(lalonde)

match.on <- colnames(lalonde)[!(colnames(lalonde) %in% c('re78', 'treat'))]
my.frontier <- makeFrontier(dataset = lalonde,
                            treatment = 'treat',
                            outcome = 're78',
                            match.on = match.on)

base.form <- as.formula('re78 ~ treat + age + education
                         + black + hispanic + married +
                         nodegree + re74 + re75')
## Not run: 
##D my.estimates <- estimateEffects(my.frontier,
##D                                 're78 ~ treat',
##D                                 mod.dependence.formula = base.form,
##D                                 continuous.vars = c('age', 'education', 're74', 're75'),
##D                                 prop.estimated = .1,
##D                                 means.as.cutpoints = TRUE)
##D 
##D plotEstimates(my.estimates)
## End(Not run)



