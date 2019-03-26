library(raptr)


### Name: update
### Title: Update object
### Aliases: update update.GurobiOpts update.ManualOpts update.RapData
###   update.RapReliableOpts update.RapUnreliableOpts update.RapUnsolOrSol

### ** Examples

# load data
data(sim_ru, sim_rs)

# GurobiOpts
x <- GurobiOpts(MIPGap = 0.7)
y <- update(x, MIPGap = 0.1)
print(x)
print(y)

# RapUnreliableOpts
x <- RapUnreliableOpts(BLM = 10)
y <- update(x, BLM = 2)
print(x)
print(y)

# RapReliableOpts
x <- RapReliableOpts(failure.multiplier = 2)
y <- update(x, failure.multiplier = 4)
print(x)
print(y)

# RapData
x <- sim_ru@data
y <- update(x, space.target = c(0.4, 0.7, 0.1))
print(space.target(x))
print(space.target(y))

## RapUnsolved
x <- sim_ru
y <- update(x, amount.target = c(0.1, 0.2, 0.3), BLM = 3, solve = FALSE)
print(x@opts@BLM); print(amount.target(x))
print(y@opts@BLM); print(space.target(y))

## RapSolved
x <- sim_rs
y <- update(x, space.target = c(0.4, 0.6, 0.9), BLM = 100, Presolve = 1L,
            solve = FALSE)
print(x@opts@BLM); print(amount.target(x))
print(y@opts@BLM); print(space.target(y))



