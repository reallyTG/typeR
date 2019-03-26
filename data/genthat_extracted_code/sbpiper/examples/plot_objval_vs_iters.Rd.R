library(sbpiper)


### Name: plot_objval_vs_iters
### Title: Plot the Objective values vs Iterations
### Aliases: plot_objval_vs_iters

### ** Examples

dir.create(file.path("pe_plots"))
v <- 10*(rnorm(10000))^4 + 10
plot_objval_vs_iters(objval.vec=v, model="model", plots_dir="pe_plots")



