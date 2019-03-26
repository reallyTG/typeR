library(TropFishR)


### Name: plot.predict_mod
### Title: Plotting prediction models yield per recruit and Thompson & Bell
### Aliases: plot.predict_mod

### ** Examples

## Not run: 
##D # Nemipterus marginatus - age structured data
##D threadfin <- list(Winf = 286,K = 0.37, t0 = -0.2, M = 1.1, tr = 0.4)
##D 
##D output <- predict_mod(threadfin, FM_change = seq(0,6,0.1),
##D    tc_change = seq(0.2,1,0.2), type = 'ypr')  #where it is maximal  = MSY
##D plot(output)
##D 
##D # hake - length structured data
##D data(hake)
##D hake$Lr <- 35
##D select.list <- list(selecType = 'trawl_ogive', L50 = 20, L75 = 24)
##D output <- predict_mod(param = hake, FM_change = seq(0,0.4,0.05),
##D                       curr.E = 0.4, curr.Lc = 40,
##D                       Lc_change = seq(5,80,1), s_list = select.list,
##D                       type = 'ypr', plot = FALSE)
##D plot(output, type = "Isopleth", xaxis1 = "FM", yaxis1 = "Y_R.rel",
##D    identify = FALSE)
##D 
## End(Not run)



