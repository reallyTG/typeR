library(heemod)


### Name: plot.run_model
### Title: Plot Results of a Markov Model
### Aliases: plot.run_model

### ** Examples


## These examples require \code{res_mod} from the hip replacement model discussed in
## `vignette("non-homogeneous", package = "heemod")`.

## Not run: 
##D   plot(res_mod)
##D 
##D   plot(res_mod, model = "all")
##D   plot(res_mod, model = "all", panels = "by_state")
##D 
##D   plot(res_mod, model = "all", include_states = c("RevisionTHR", "SuccessR"))
##D   plot(res_mod, model = "all", panels = "by_state", include_states = c("RevisionTHR", "SuccessR"))
##D  
##D   plot(res_mod, model = 2, panel = "by_state", include_states = c("RevisionTHR", "SuccessR"))
##D   
## End(Not run)



