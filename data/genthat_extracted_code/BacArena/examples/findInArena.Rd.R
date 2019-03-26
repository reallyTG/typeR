library(BacArena)


### Name: findInArena
### Title: Function for searching a keyword in arena organisms and media
### Aliases: findInArena findInArena,Arena-method

### ** Examples

data(Ec_core)
bac <- Bac(Ec_core)
arena <- Arena(n=20,m=20)
arena <- addOrg(arena,bac,amount=10)
findInArena(arena, "acetate")



