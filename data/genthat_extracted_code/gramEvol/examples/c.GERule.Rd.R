library(gramEvol)


### Name: c
### Title: Grammar Rule Concatenation
### Aliases: c.GERule

### ** Examples

rule1 <- grule(Func1, Func2)
rule2 <- grule(`*`, `/`)

rule.all <- c(rule1, rule2)

print(rule.all)



