library(gistr)


### Name: run
### Title: Run a .Rmd file
### Aliases: run

### ** Examples

## Not run: 
##D # run a local file
##D file <- system.file("examples", "stuff.Rmd", package = "gistr")
##D run(file) %>% gist_create
##D 
##D # run code
##D run({'
##D ```{r}
##D x <- letters
##D (numbers <- runif(8))
##D ```
##D '}) %>% gist_create
##D 
##D # run a file from a gist, has to get file first
##D gists('minepublic')[[2]] %>% run() %>% update()
## End(Not run)



