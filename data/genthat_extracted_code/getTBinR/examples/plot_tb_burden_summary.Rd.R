library(getTBinR)


### Name: plot_tb_burden_summary
### Title: Plot Summaries of TB Burden - By Region, Globally and for Custom
###   Groups
### Aliases: plot_tb_burden_summary

### ** Examples


## Get an overview of incidence rates regionally and globally compared to the UK
plot_tb_burden_summary(metric = "e_inc_num",
                       metric_label = "e_inc_100k",
                       stat = "rate",
                       countries = "United Kingdom", 
                       compare_to_world = TRUE, 
                       compare_all_regions = TRUE,
                       verbose = FALSE,
                       scales = "free_y",
                       facet = "Area") 
## Not run: 
##D 
##D 
##D ## Get summary data for the UK, Europe and the world
##D ## Bootstrapping CI's 
##D plot_tb_burden_summary(metric = "e_inc_num",
##D                        samples = 100,
##D                        stat = "mean",
##D                        countries = "United Kingdom", 
##D                        compare_to_world = TRUE, 
##D                        compare_to_region = TRUE,
##D                        verbose = FALSE,
##D                        facet = "Area",
##D                        scales = "free_y")
##D                     
## End(Not run)                     



