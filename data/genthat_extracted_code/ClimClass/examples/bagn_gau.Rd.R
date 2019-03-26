library(ClimClass)


### Name: bagn_gau
### Title: Bagnouls - Gaussen graphs
### Aliases: bagn_gau

### ** Examples


data(Trent_climate)
# clima_81_10 can be generated from monthly time series by function "climate".
par(ask=TRUE)
for(sta in 1:length(clima_81_10)) {
  bagn_gau(clim_norm_sta= clima_81_10 [[sta]], 
   main_title=paste(names(clima_81_10[sta]), "  1981-2010")
	, bar_width=40)
}





