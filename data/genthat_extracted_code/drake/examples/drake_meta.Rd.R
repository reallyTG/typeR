library(drake)


### Name: drake_meta
### Title: Compute the initial pre-build metadata of a target or import.
### Aliases: drake_meta

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D # This example is not really a user-side demonstration.
##D # It just walks through a dive into the internals.
##D # Populate your workspace and write 'report.Rmd'.
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Create the master internal configuration list.
##D config <- drake_config(my_plan)
##D # Optionally, compute metadata on 'small',
##D # including a hash/fingerprint
##D # of the dependencies. If meta is not supplied,
##D # drake_build() computes it automatically.
##D meta <- drake_meta(target = "small", config = config)
##D # Should not yet include 'small'.
##D cached()
##D # Build 'small'.
##D # Equivalent to just drake_build(target = "small", config = config).
##D drake_build(target = "small", config = config, meta = meta)
##D # Should now include 'small'
##D cached()
##D readd(small)
##D })
## End(Not run)



