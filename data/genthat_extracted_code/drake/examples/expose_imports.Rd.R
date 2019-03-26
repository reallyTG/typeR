library(drake)


### Name: expose_imports
### Title: Expose all the imports in a package so 'make()' can detect all
###   the package's nested functions.
### Aliases: expose_imports

### ** Examples

## Not run: 
##D test_with_dir("contain this example's side effects", {
##D # Suppose you have a workflow that uses the `digest()` function,
##D # which computes the hash of an object.
##D 
##D library(digest) # Has the digest() function.
##D g <- function(x) {
##D   digest(x)
##D }
##D f <- function(x) {
##D   g(x)
##D }
##D plan <- drake_plan(x = f(1))
##D 
##D # Here are the reproducibly tracked objects in the workflow.
##D config <- drake_config(plan)
##D tracked(config)
##D 
##D # But the digest() function has dependencies too.
##D head(deps_code(digest))
##D 
##D # Why doesn't `drake` import them? Because it knows `digest()`
##D # is from a package, and it doesn't usually dive into functions
##D # from packages. We need to call expose_imports() to expose
##D # a package's inner functions.
##D 
##D expose_imports(digest)
##D config <- drake_config(plan)
##D new_objects <- tracked(config)
##D head(new_objects, 10)
##D length(new_objects)
##D 
##D # Now when you call `make()`, `drake` will dive into `digest`
##D # to import dependencies.
##D 
##D cache <- storr::storr_environment() # just for examples
##D make(plan, cache = cache)
##D head(cached(cache = cache), 10)
##D length(cached(cache = cache))
##D 
##D # Why would you want to expose a whole package like this?
##D # Because you may want to wrap up your data science project
##D # as a formal R package. In that case, `expose_imports()`
##D # tells `drake` to reproducibly track all of your code,
##D # not just the exported API functions you mention in
##D # workflow plan commands.
##D 
##D # Note: if you use `digest::digest()`` instead of just `digest()`,
##D # `drake` does not dive into the function body anymore.
##D g <- function(x) {
##D   digest::digest(x) # Was previously just digest()
##D }
##D config <- drake_config(plan)
##D tracked(config)
##D })
## End(Not run)



