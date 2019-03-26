library(rLDCP)


### Name: infer_rules
### Title: Make the inference
### Aliases: infer_rules

### ** Examples

## In the example the input of the fuzzy rule correspond with two CPs and each CP has 3
## linguistic variables, e.g, {"bad", "good", "very good"}. The output also
## correspond with a CP with 3 linguistic variables.

 infer_rules(fuzzy_rules(fuzzy_rule(0,0,1, 0,0,1, 0,0,1),
                   fuzzy_rule(1,0,0, 1,0,0, 1,0,0),
                   fuzzy_rule(0,1,0, 0,1,0, 0,1,0)),
             operator(min, max),
             list(c(0,0.5,0.5),c(0.5,0.5,0)))
## [1] 0.0 0.5 0.0



