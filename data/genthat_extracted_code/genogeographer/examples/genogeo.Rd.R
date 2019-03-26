library(genogeographer)


### Name: genogeo
### Title: Likelihood ratio tests for AIMs
### Aliases: genogeo

### ** Examples

df_ <- simulate_pops(pop_n = 20, aims_n = 50)
df_db <- pops_to_DB(df_)
profile <- random_AIMs_profile(df_db, keep_pop = TRUE)
profile$pop[1] # The true population
result <- genogeo(profile[,c("locus","x0")], df = df_db)



