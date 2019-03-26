library(rmake)


### Name: makefile
### Title: Generate Makefile from given list of rules ('job').
### Aliases: makefile

### ** Examples

# create some jobs
job <- list(
    rRule('dataset.rds', 'preprocess.R', 'dataset.csv'),
    markdownRule('report.pdf', 'report.Rmd', 'dataset.rds'),
    markdownRule('details.pdf', 'details.Rmd', 'dataset.rds'))

# generate Makefile (output as a character vector)
makefile(job)

# generate to file
tmp <- tempdir()
makefile(job, file.path(tmp, "Makefile"))



