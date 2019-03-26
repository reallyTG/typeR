library(SiMRiv)


### Name: state
### Title: Define a movement state
### Aliases: state state.Resting state.RW state.CRW

### ** Examples

## a correlated random walk influenced by landscape

state(0.97, perceptualRange("cir", 500), 10, "CorrelatedRW")

## the same, but using the shortcut form

state.CRW(0.97) * 500 + 10



