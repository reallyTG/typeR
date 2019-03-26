library(getTBinR)


### Name: plot_tb_burden
### Title: Plot TB Burden by Country
### Aliases: plot_tb_burden

### ** Examples


## Get the WHO TB burden data and the data dictionary
tb_burden <- get_tb_burden()
dict <- get_data_dict()

## Get a random sample of 9 countries
sample_countries <- sample(unique(tb_burden$country), 9)

## Plot incidence rates in these countries
plot_tb_burden(df = tb_burden, dict = dict, facet = "country", countries = sample_countries)
## Not run: 
##D ## Use data caching to plot incidence rates with free y scales
##D plot_tb_burden(facet = "country", countries = sample_countries, scales = "free_y")
##D  
##D ## Plot annual percentage change in incidence rates in selected countries
##D plot_tb_burden(df = tb_burden, dict = dict, facet = "country", scales = "free_y", 
##D                countries = sample_countries, annual_change = TRUE, conf = NULL)
##D                
##D ## Find variables relating to mortality in the WHO dataset
##D search_data_dict(def = "mortality")
##D ## Plot mortality rates (exc HIV) - without progress messages
##D plot_tb_burden(metric = "e_mort_exc_tbhiv_100k", facet = "country", 
##D                countries = sample_countries, scales = "free_y", verbose = FALSE)
## End(Not run)  



