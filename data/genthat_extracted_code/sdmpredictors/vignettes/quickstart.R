## ---- message=F, warning=F-----------------------------------------------
library(sdmpredictors)

# exploring the marine datasets 
datasets <- list_datasets(terrestrial = FALSE, marine = TRUE)

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(datasets, row.names = FALSE)

## ------------------------------------------------------------------------
# exploring the marine layers 
layers <- list_layers(datasets)

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(layers[1:3,1:4], row.names = FALSE)

## ------------------------------------------------------------------------
# print the Bio-ORACLE citation
print(dataset_citations("Bio-ORACLE"))

# print the citation for ENVIREM as Bibtex
print(lapply(dataset_citations("WorldClim", astext = FALSE), toBibtex))

# print the citation for a MARSPEC paleo layer
print(layer_citations("MS_biogeo02_aspect_NS_21kya"))

## ------------------------------------------------------------------------
# download pH and Salinity to the temporary directory
load_layers(layers[layers$name %in% c("pH", "Salinity") & 
                     layers$dataset_code == "Bio-ORACLE",], datadir = tempdir())

# set a default datadir, preferably something different from tempdir()
options(sdmpredictors_datadir= tempdir())

# (down)load specific layers 
specific <- load_layers(c("BO_ph", "BO_salinity"))

# equal area data (Behrmann equal area projection) 
equalarea <- load_layers("BO_ph", equalarea = TRUE)

## ------------------------------------------------------------------------
# exploring the available future marine layers 
future <- list_layers_future(terrestrial = FALSE) 
# available scenarios 
unique(future$scenario) 
unique(future$year)

paleo <- list_layers_paleo(terrestrial = FALSE)
unique(paleo$epoch) 
unique(paleo$model_name) 

## ------------------------------------------------------------------------
get_layers_info(c("BO_calcite","BO_B1_2100_sstmax","MS_bathy_21kya"))$common

# functions to get the equivalent future layer code for a current climate layer 
get_future_layers(c("BO_sstmax", "BO_salinity"), 
                  scenario = "B1", 
                  year = 2100)$layer_code 

# functions to get the equivalent paleo layer code for a current climate layer 
get_paleo_layers(c("MS_bathy_5m", "MS_biogeo13_sst_mean_5m"), 
                 model_name = c("21kya_geophysical", "21kya_ensemble_adjCCSM"), 
                 years_ago = 21000)$layer_code 

## ---- message=F, warning=F-----------------------------------------------
# looking up statistics and correlations for marine annual layers
datasets <- list_datasets(terrestrial = FALSE, marine = TRUE)
layers <- list_layers(datasets)

# filter out monthly layers
layers <- layers[is.na(layers$month),]

layer_stats(layers)[1:2,]

correlations <- layers_correlation(layers)

# create groups of layers where no layers in one group 
# have a correlation > 0.7 with a layer from another group 
groups <- correlation_groups(correlations, max_correlation=0.7)

# group lengths
sapply(groups, length)

for(group in groups) {
  if(length(group) > 1) {
    cat(paste(group, collapse =", "))
    cat("\n")
  }
}

# plot correlations (requires ggplot2)
plot_correlation(correlations)

