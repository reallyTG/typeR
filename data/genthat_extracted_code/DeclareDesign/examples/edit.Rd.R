library(DeclareDesign)


### Name: clone_dot_edit_env
### Title: Override environment via shim
### Aliases: clone_dot_edit_env clone_step_edit clone_design_edit
### Keywords: internal

### ** Examples

## Not run: 
##D here_i_am <- "foo"
##D dot <- quo(here_i_am)
##D dot2 <- clone_dot_edit_env(dot, here_i_am = "some_message", xyxyx = "bar")
##D eval_tidy(dot)
##D eval_tidy(dot2)
## End(Not run)
## Not run: 
##D N <- 50
##D 
##D pop50 <- declare_population(N=N, noise=rnorm(N))
##D nrow(pop50())
##D 
##D pop100 <- DeclareDesign:::clone_step_edit(pop50, N=100)
##D nrow(pop100())
##D nrow(pop50())
##D 
## End(Not run)
N <- 50

## Not run: 
##D 
##D my_design <- declare_population(N=N, noise=rnorm(N)) + NULL
##D my_design2 <- DeclareDesign:::clone_design_edit(my_design, N=100)
##D 
##D nrow(draw_data(my_design))
##D nrow(draw_data(my_design2))
##D 
## End(Not run)



