library(mason)


### Name: scrub
### Title: Scrub down and polish up the constructed analysis results.
### Aliases: scrub

### ** Examples


ds <- design(iris, 'cor')
ds <- add_settings(ds)
ds <- add_variables(ds, 'xvars', c('Sepal.Length', 'Sepal.Width'))
ds <- construct(ds)
scrub(ds)




