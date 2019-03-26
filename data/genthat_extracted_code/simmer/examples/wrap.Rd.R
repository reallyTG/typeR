library(simmer)


### Name: wrap
### Title: Wrap a Simulation Environment
### Aliases: wrap

### ** Examples

## Not run: 
##D library(parallel)
##D 
##D mm1 <- trajectory() %>%
##D   seize("server", 1) %>%
##D   timeout(function() rexp(1, 2)) %>%
##D   release("server", 1)
##D 
##D envs <- mclapply(1:4, function(i) {
##D   simmer("M/M/1 example") %>%
##D     add_resource("server", 1) %>%
##D     add_generator("customer", mm1, function() rexp(1, 1)) %>%
##D     run(100) %>%
##D     wrap()
##D })
## End(Not run)



