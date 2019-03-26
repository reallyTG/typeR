library(foreSIGHT)


### Name: plotLayers
### Title: plotLayers
### Aliases: plotLayers

### ** Examples

## Not run: 
##D data(tankPlot)
##D data(climdata2030)          #loading climate data for 2030 time slice
##D 
##D ###Example 1
##D # Saved from a previous example
##D # tank_simpleScale_plot<-performanceSpaces(data=tank_simple_scenarios,
##D #                                          plotTag = "Heat",
##D #                                          plotArgs=plotArgs,
##D #                                          systemModel = tankWrapper,
##D #                                          systemArgs = systemArgs)
##D 
##D #Create plotting arguments
##D plotArgs<-list(title="Scenario neutral space with projections overlaid",
##D                ylim=c(0.7,1.3),
##D                xlim=c(-2,2),
##D                xtitle="Temp_ann_avg_m",
##D                ytitle="P_ann_tot_m")
##D 
##D climArgs<-list(performancelimits=NULL,
##D                label=NULL,
##D                slice=2030,
##D                colour="black",
##D                fill="performance")
##D 
##D #Plot performance space with projections overlaid
##D tank_overlay_plot=plotLayers(plot=tank_simpleScale_plot$plotEdit,
##D                              plotArgs=plotArgs,
##D                              climdata=climdata,
##D                              climArgs=climArgs)
##D tank_overlay_plot
## End(Not run)



