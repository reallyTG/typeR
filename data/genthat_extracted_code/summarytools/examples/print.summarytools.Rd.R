library(summarytools)


### Name: print.summarytools
### Title: Print Method for Objects of Class 'summarytools'.
### Aliases: print.summarytools print view
### Keywords: methods print

### ** Examples

  ## Not run: 
##D   data(tobacco)
##D   view(dfSummary(tobacco), footnote = NA)
##D   
## End(Not run)
  data(exams)
  print(freq(exams$gender), style = 'rmarkdown')
  print(descr(exams), omit.headings = TRUE)




