library(rmake)


### Name: prerequisites
### Title: Return given set of properties of all rules in a list
### Aliases: prerequisites getters targets tasks terminals

### ** Examples

job <- 'data.csv' %>>%
  rRule('process.R', task='basic') %>>%
  'data.rds' %>>%
  markdownRule('report.Rnw', task='basic') %>>%
  'report.pdf'

prerequisites(job)    # returns c('process.R', data.csv', 'report.Rnw', 'data.rds')
targets(job)          # returns c('data.rds', 'report.pdf')
tasks(job)            # returns 'basic'



