library(tspmeta)


### Name: run_solver
### Title: Runs a solver on a TSP instance.
### Aliases: run_solver

### ** Examples

x = random_instance(10)
tours = sapply(c("nn", "cheapest_insertion", "arbitrary_insertion"), function(solver) {
  list(solver = run_solver(x, method = solver))
})
## Not run: 
##D   concorde_path(path = "/absolute/path/to/concorde/executable")
##D   concorde_tour = run_solver(x, method = "concorde")
##D   concorde_tour = run_solver(x, method = "linkern")
## End(Not run)



