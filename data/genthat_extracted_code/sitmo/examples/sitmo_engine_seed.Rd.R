library(sitmo)


### Name: sitmo_engine_seed
### Title: Example Seed Set and RNG Draws with sitmo
### Aliases: sitmo_engine_seed

### ** Examples

n = 10
a = sitmo_engine_seed(n, 1337)
b = sitmo_engine_seed(n, 1337)
c = sitmo_engine_seed(n, 1338)

isTRUE(all.equal(a,b))
isTRUE(all.equal(a,c))



