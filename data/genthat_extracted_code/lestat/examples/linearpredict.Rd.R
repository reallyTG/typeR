library(lestat)


### Name: linearpredict
### Title: Create a Linear Extension of a Distribution
### Aliases: linearpredict linearpredict.default
###   linearpredict.mnormalexpgamma linearpredict.mnormalgamma
###   linearpredict.mnormal linearpredict.normalexpgamma
###   linearpredict.normalgamma linearpredict.normal

### ** Examples

prior <- normalgamma()
full  <- linearpredict(prior, rep(1, 7))
data  <- simulate(normal(), 7)
posterior <- conditional(full, 1:7, data)
plot(posterior)



