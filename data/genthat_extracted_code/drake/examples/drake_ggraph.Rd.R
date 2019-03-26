library(drake)


### Name: drake_ggraph
### Title: Show a 'ggraph'/'ggplot2' representation of your drake project.
### Aliases: drake_ggraph

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan)
##D # Plot the network graph representation of the workflow.
##D drake_ggraph(config) # Save to a file with `ggplot2::ggsave()`.
##D })
## End(Not run)



