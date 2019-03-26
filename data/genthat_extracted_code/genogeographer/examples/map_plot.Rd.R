library(genogeographer)


### Name: map_plot
### Title: Plot LTR z-scores on map
### Aliases: map_plot

### ** Examples

df_ <- simulate_pops(pop_n = 4, aims_n = 50)
df_db <- pops_to_DB(df_)
profile <- random_AIMs_profile(df_db, keep_pop = TRUE)
profile$pop[1] # The true population
result <- genogeo(profile[,c("locus","x0")], df = df_db, min_n = 0) 
result$lon <- runif(n = 4, min = -125, max = 125)
result$lat <- runif(n = 4, min = -50, max = 80)
## Not run: map_plot(result)



