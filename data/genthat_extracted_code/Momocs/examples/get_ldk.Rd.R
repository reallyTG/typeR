library(Momocs)


### Name: get_ldk
### Title: Retrieves landmarks coordinates
### Aliases: get_ldk

### ** Examples

# Out example
ldk.h <- get_ldk(hearts)
stack(Ldk(ldk.h))

# on Ldk (no slidings)
get_ldk(wings) # equivalent to wings$coo

# on Ldk (slidings)
get_ldk(chaff)
get_ldk(chaff) %>% Ldk %>% fgProcrustes(tol=0.1) %>% stack



