library(micompr)


### Name: summary.micomp
### Title: Summary method for multiple comparisons of outputs
### Aliases: summary.micomp

### ** Examples


# A micomp object from package datasets (i.e. grpoutputs objects) directly
## No test: 
summary(micomp(5, 0.85,
               list(list(name = "CompEq", grpout = pphpc_ok),
                    list(name = "CompNoShuf", grpout = pphpc_noshuff),
                    list(name = "CompDiff", grpout = pphpc_diff))))
## End(No test)



