library(dynamichazard)


### Name: ddFixed
### Title: Auxiliary Functions for Fixed Effects
### Aliases: ddFixed ddFixed_intercept

### ** Examples

# we can get a time-invariant effect of `x1` by
## Not run: 
##D ddhazard(Surv(stop, event) ~ ddFixed(x1), data)
## End(Not run)

# all of the calls below will yield the same result with a time-invariant
# intercept:
## Not run: 
##D ddhazard(Surv(stop, event) ~ ddFixed_intercept() + x1, data)
##D ddhazard(Surv(stop, event) ~ -1 + ddFixed_intercept() + x1, data)
## End(Not run)



