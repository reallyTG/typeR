library(drake)


### Name: prepare_distributed
### Title: Do the preparatory work for 'make()' with a distributed
###   computing backend (see the 'parallelism' argument of 'make()').
### Aliases: prepare_distributed
### Keywords: internal

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan)
##D prepare_distributed(config = config)
##D })
## End(Not run)



