library(saeSim)


### Name: sim
### Title: Start simulation
### Aliases: sim

### ** Examples

setup <- sim_base_lm()
resultList <- sim(setup, R = 1)

# For parallel computations you may need to export objects
localFun <- function() cat("Hello World!")
comp_fun <- function(dat) {
  localFun()
  dat
}

res <- sim_base_lm() %>% 
  sim_comp_pop(comp_fun) %>% 
  sim(R = 2, 
      mode = "socket", cpus = 2,
      exports = "localFun")

str(res)



