library(sitmo)


### Name: sitmo_engine_reset
### Title: Example Seed Set and RNG Draws with sitmo
### Aliases: sitmo_engine_reset

### ** Examples

n = 10
a = sitmo_engine_reset(n, 1337)

isTRUE(all.equal(a[,1],a[,2]))



