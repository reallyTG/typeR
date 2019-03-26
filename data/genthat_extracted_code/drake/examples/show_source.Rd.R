library(drake)


### Name: show_source
### Title: Show how a target/import was produced.
### Aliases: show_source

### ** Examples

plan <- drake_plan(x = sample.int(15))
cache <- storr::storr_environment() # custom in-memory cache
make(plan, cache = cache)
config <- drake_config(plan, cache = cache)
show_source(x, config)



