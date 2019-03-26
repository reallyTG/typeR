library(rredlist)


### Name: rl_sp
### Title: Get species
### Aliases: rl_sp rl_sp_

### ** Examples

## Not run: 
##D rl_sp(page = 3)
##D 
##D # get all results
##D out <- rl_sp(all = TRUE)
##D length(out)
##D vapply(out, "[[", 1, "count")
##D all_df <- do.call(rbind, lapply(out, "[[", "result"))
##D head(all_df)
##D NROW(all_df)
## End(Not run)



