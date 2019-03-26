library(overture)


### Name: Peek
### Title: Load samples from a partial MCMC run
### Aliases: Peek

### ** Examples

## No test: 
SampleSomething <- function() {
    Sys.sleep(0.1)
    rnorm(1)
}

backing.path <- tempfile()
dir.create(backing.path)
print(backing.path)

SlowMcmc <- InitMcmc(1000, backing.path=backing.path)
SlowMcmc({
    x <- SampleSomething()
})

### In another R process, while the MCMC is still running...
samples.so.far <- Peek(backing.path)
samples.so.far$x[,]
## End(No test)



