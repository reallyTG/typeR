library(Rdrools)


### Name: runRulesDrl
### Title: Apply a set of rule transformations to a data frame
### Aliases: runRulesDrl

### ** Examples

library(Rdrools)
data(class)
data(rules)
input.columns<-c('name', 'class', 'grade', 'email')
output.columns<-c('address', 'subject', 'body')
rulesSession<-rulesSessionDrl(rules, input.columns, output.columns)
output.df<-runRulesDrl(rulesSession, class)



