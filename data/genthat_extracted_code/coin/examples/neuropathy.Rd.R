library(coin)


### Name: neuropathy
### Title: Acute Painful Diabetic Neuropathy
### Aliases: neuropathy
### Keywords: datasets

### ** Examples

## Conover and Salsburg (1988, Tab. 2)

## One-sided approximative Fisher-Pitman test
oneway_test(pain ~ group, data = neuropathy,
            alternative = "less",
            distribution = approximate(B = 10000))

## One-sided approximative Wilcoxon-Mann-Whitney test
wilcox_test(pain ~ group, data = neuropathy,
            alternative = "less",
            distribution = approximate(B = 10000))

## One-sided approximative Conover-Salsburg test
oneway_test(pain ~ group, data = neuropathy,
            alternative = "less",
            distribution = approximate(B = 10000),
            ytrafo = function(data)
                trafo(data, numeric_trafo = consal_trafo))

## One-sided approximative maximum test for a range of 'a' values
it <- independence_test(pain ~ group, data = neuropathy,
                        alternative = "less",
                        distribution = approximate(B = 10000),
                        ytrafo = function(data)
                            trafo(data, numeric_trafo = function(y)
                                consal_trafo(y, a = 2:7)))
pvalue(it, method = "single-step")



