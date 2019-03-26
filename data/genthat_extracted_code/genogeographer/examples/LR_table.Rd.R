library(genogeographer)


### Name: LR_table
### Title: Compute pairwise likelihood ratios
### Aliases: LR_table

### ** Examples

df_ <- simulate_pops(pop_n = 4, aims_n = 50)
df_db <- pops_to_DB(df_)
profile <- random_AIMs_profile(df_db, keep_pop = TRUE)
profile$pop[1] # The true population
result <- genogeo(profile[,c("locus","x0")], df = df_db)
LR_table(result)



