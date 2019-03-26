library(getTBinR)


### Name: plot_tb_burden_overview
### Title: Plot an overview of TB Burden for Multiple Countries
### Aliases: plot_tb_burden_overview

### ** Examples


## Plot incidence rates over time for both the United Kingdom and Botswana
plot_tb_burden_overview(countries = c("United Kingdom", "Botswana"), 
                        compare_to_region = FALSE)
 
## Plot percentage annual change in incidence rates.
plot_tb_burden_overview(countries = c("United Kingdom", "Botswana"), 
                        compare_to_region = FALSE, annual_change = TRUE)
                         
## Compare incidence rates in the UK and Botswana to incidence rates in their regions
plot_tb_burden_overview(countries = c("United Kingdom", "Botswana"), 
                        compare_to_region = TRUE)
   
## Find variables relating to mortality in the WHO dataset
search_data_dict(def = "mortality")
                   
## Compare mortality rates (exc HIV) in the UK and Botswana to mortality rates in their regions
## Do not show progress messages
plot_tb_burden_overview(metric = "e_mort_exc_tbhiv_100k",
                        countries = c("United Kingdom", "Botswana"), 
                        compare_to_region = TRUE, verbose = FALSE)



