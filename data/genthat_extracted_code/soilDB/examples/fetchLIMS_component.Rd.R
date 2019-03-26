library(soilDB)


### Name: fetchNASISWebReport
### Title: Extract component tables from a the NASIS Web Reports
### Aliases: fetchNASISWebReport get_project_from_NASISWebReport
###   get_progress_from_NASISWebReport
###   get_project_correlation_from_NASISWebReport
###   get_mapunit_from_NASISWebReport
###   get_projectmapunit_from_NASISWebReport
###   get_projectmapunit2_from_NASISWebReport
###   get_component_from_NASISWebReport get_chorizon_from_NASISWebReport
###   get_cosoilmoist_from_NASISWebReport
###   get_sitesoilmoist_from_NASISWebReport
### Keywords: manip

### ** Examples

## Not run: 
##D library(soilDB)
##D library(ggplot2)
##D library(gridExtra)
##D 
##D # query soil components by projectname
##D test = fetchNASISWebReport_component(
##D "EVAL - MLRA 111A - Ross silt loam, 0 to 2 percent slopes, frequently flooded"
##D )
##D test = test$spc
##D 
##D # profile plot
##D plot(test)
##D 
##D # convert the data for depth plot
##D clay_slice = horizons(slice(test, 0:200 ~ claytotal_l + claytotal_r + claytotal_h))
##D names(clay_slice) <- gsub("claytotal_", "", names(clay_slice))
##D 
##D om_slice = horizons(slice(test, 0:200 ~ om_l + om_r + om_h))
##D names(om_slice) = gsub("om_", "", names(om_slice))
##D 
##D test2 = rbind(data.frame(clay_slice, var = "clay"),
##D               data.frame(om_slice, var = "om")
##D               )
##D 
##D h = merge(test2, site(test)[c("dmuiid", "coiid", "compname", "comppct_r")],
##D           by = "coiid", 
##D           all.x = TRUE
##D           )
##D 
##D # depth plot of clay content by soil component
##D gg_comp <- function(x) {
##D   ggplot(x) +
##D   geom_line(aes(y = r, x = hzdept_r)) +
##D   geom_line(aes(y = r, x = hzdept_r)) +
##D   geom_ribbon(aes(ymin = l, ymax = h, x = hzdept_r), alpha = 0.2) +
##D   xlim(200, 0) +
##D   xlab("depth (cm)") +
##D   facet_grid(var ~ dmuiid + paste(compname, comppct_r)) +
##D   coord_flip()
##D   }
##D g1 <- gg_comp(subset(h, var == "clay"))
##D g2 <- gg_comp(subset(h, var == "om"))
##D 
##D grid.arrange(g1, g2)
##D 
##D 
##D # query cosoilmoist (e.g. water table data) by mukey
##D # NA depths are interpreted as (???) with impute=TRUE argument
##D x <- get_cosoilmoist_from_NASISWebReport(
##D "EVAL - MLRA 111A - Ross silt loam, 0 to 2 percent slopes, frequently flooded"
##D )
##D 
##D ggplot(x, aes(x = as.integer(month), y = dept_r, lty = status)) +
##D   geom_rect(aes(xmin = as.integer(month), xmax = as.integer(month) + 1,
##D                 ymin = 0, ymax = max(x$depb_r),
##D                 fill = flodfreqcl)) +
##D   geom_line(cex = 1) +
##D   geom_point() +
##D   geom_ribbon(aes(ymin = dept_l, ymax = dept_h), alpha = 0.2) +
##D   ylim(max(x$depb_r), 0) +
##D   xlab("month") + ylab("depth (cm)") +
##D   scale_x_continuous(breaks = 1:12, labels = month.abb, name="Month") +
##D   facet_wrap(~ paste0(compname, ' (', comppct_r , ')')) +
##D   ggtitle(paste0(x$nationalmusym[1], 
##D   ': Water Table Levels from Component Soil Moisture Month Data'))
##D 
##D   
## End(Not run)



