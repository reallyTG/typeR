library(BacArena)


### Name: openArena
### Title: Start simulation
### Aliases: openArena

### ** Examples

## No test: 
 
sim <- openArena()
evalArena(sim, time=5, phencol = TRUE, 
          plot_items=c("Population", "EX_o2(e)", "EX_for(e)", "EX_glc(e)"))
## End(No test)



