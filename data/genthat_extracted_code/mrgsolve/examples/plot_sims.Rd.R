library(mrgsolve)


### Name: plot_sims
### Title: Plot data as an mrgsims object
### Aliases: plot_sims

### ** Examples


mod <- mrgsolve:::house() %>% ev(amt = 100)

out <- mrgsim(mod) 
out_df <- dplyr::mutate(out, time <= 72)

plot(out)
plot_sims(out, CP, RESP)

## Not run: 
##D plot_sims(out, .f = ~ CP + RESP)
##D plot_sims(out, .f = CP + RESP ~ time)
## End(Not run)




