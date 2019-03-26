library(rmake)


### Name: visualize
### Title: Visualize dependencies defined by a rule or a list of rules
### Aliases: visualize

### ** Examples

job <- c('data1.csv', 'data2.csv') %>>%
  rRule('process.R') %>>%
  'data.rds' %>>%
  markdownRule('report.Rmd') %>>%
  'report.pdf'

## Not run: 
##D visualize(job)
## End(Not run)



