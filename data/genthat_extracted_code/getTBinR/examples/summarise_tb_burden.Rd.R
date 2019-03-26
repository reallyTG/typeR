library(getTBinR)


### Name: summarise_tb_burden
### Title: Summarise TB Burden
### Aliases: summarise_tb_burden

### ** Examples


## Get the most recent year of data
tb_burden <- get_tb_burden()
most_recent_year <- max(tb_burden$year)

## Get summary of the e_mdr_pct_rr_new cases
summarise_tb_burden(metric = "e_mdr_pct_rr_new",
                    years =  most_recent_year,
                    samples = 100,
                    compare_all_regions = TRUE,
                    compare_to_world = TRUE,
                    verbose = TRUE)
## Not run: 
##D ## Get median (with 95% IQR) of the case fatality rate for regions and the world
##D ## Boostrapping uncertainty in country measures
##D summarise_tb_burden(metric = "cfr",
##D                     years =  most_recent_year,
##D                     samples = 100,
##D                     stat = "median",
##D                     compare_all_regions = TRUE,
##D                     compare_to_world = TRUE,
##D                     verbose = FALSE)
##D 
##D 
##D ## Get summary data for the UK, Europe and the world
##D ## Bootstrapping CI's 
##D summarise_tb_burden(metric = "e_inc_num",
##D                     samples = 100,
##D                     stat = "median",
##D                     countries = "United Kingdom", 
##D                     compare_to_world = TRUE, 
##D                     compare_to_region = TRUE,
##D                     verbose = FALSE)
## End(Not run)                     



