library(rmonad)


### Name: memory_cache
### Title: Store a value in memory
### Aliases: memory_cache

### ** Examples

foo <- 45
foo_proxy <- memory_cache(foo)
foo
foo_proxy@get()



