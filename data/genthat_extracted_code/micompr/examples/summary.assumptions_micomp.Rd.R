library(micompr)


### Name: summary.assumptions_micomp
### Title: Summary method for the assumptions of parametric tests used in
###   multiple comparisons of outputs
### Aliases: summary.assumptions_micomp

### ** Examples

## No test: 
# Create a micomp object, use provided dataset
mic <- micomp(5, c(0.7, 0.8, 0.9),
              list(list(name = "NLOKvsJEXOK", grpout = pphpc_ok),
                   list(name = "NLOKvsJEXNOSHUFF", grpout = pphpc_noshuff)),
              concat = TRUE)

# Get the assumptions summary
sam <- summary(assumptions(mic))
## End(No test)



