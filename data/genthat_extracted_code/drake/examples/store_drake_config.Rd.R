library(drake)


### Name: store_drake_config
### Title: Store an internal configuration list from 'drake_config()'.
### Aliases: store_drake_config
### Keywords: internal

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan)
##D store_drake_config(config = config)
##D read_drake_config()
##D })
## End(Not run)



