library(rmake)


### Name: %>>%
### Title: A pipe operator for rmake rules
### Aliases: %>>%

### ** Examples


job1 <- 'data.csv' %>>%
  rRule('preprocess.R') %>>%
  'data.rds' %>>%
  markdownRule('report.rnw') %>>%
  'report.pdf'

# is equivalent to

job2 <- list(rRule(target='data.rds', script='preprocess.R', depends='data.csv'),
             markdownRule(target='report.pdf', script='report.rnw', depends='data.rds'))



