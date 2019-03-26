library(Rdrools)


### Name: rulesSessionDrl
### Title: Creates a session of the rules engine
### Aliases: rulesSessionDrl

### ** Examples

library(Rdrools)
data(class)
data(rules)
input.columns<-c('name', 'class', 'grade', 'email')
output.columns<-c('address', 'subject', 'body')
rulesSession<-rulesSessionDrl(rules, input.columns, output.columns)
output.df<-runRulesDrl(rulesSession, class)



