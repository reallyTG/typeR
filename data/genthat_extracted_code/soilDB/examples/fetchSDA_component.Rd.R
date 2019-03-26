library(soilDB)


### Name: fetchSDA_component
### Title: Extract component tables from Soil Data Access
### Aliases: fetchSDA_component get_mapunit_from_SDA get_component_from_SDA
###   get_chorizon_from_SDA get_cosoilmoist_from_SDA
###   get_cosoilmoist_from_NASIS get_cointerp_from_SDA
### Keywords: manip

### ** Examples

## Not run: 
##D library(soilDB)
##D library(ggplot2)
##D library(gridExtra)
##D 
##D # query soil components by areasymbol and musym
##D test = fetchSDA_component(WHERE = "areasymbol = 'IN005' AND musym = 'MnpB2'")
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
##D h = merge(test2, site(test)[c("nationalmusym", "cokey", "compname", "comppct_r")],
##D           by = "cokey", 
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
##D   facet_grid(var ~ nationalmusym + paste(compname, comppct_r)) +
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
##D x <- get_cosoilmoist_from_SDA(WHERE = "mukey = '1395352'", impute = TRUE)
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
##D 
##D # query all Miami major components
##D s <- get_component_from_SDA(WHERE = "compname = 'Miami' AND majcompflag = 'Yes'")
##D 
##D # landform vs 3-D morphometry
##D test <- {
##D   subset(s, ! is.na(landform) | ! is.na(geompos)) ->.;
##D   split(., .$drainagecl, drop = TRUE) ->.;
##D   lapply(., function(x) {
##D     test = data.frame()
##D     test = as.data.frame(table(x$landform, x$geompos))
##D     test$compname   = x$compname[1]
##D     test$drainagecl = x$drainagecl[1]
##D     names(test)[1:2] <- c("landform", "geompos")
##D     return(test)
##D     }) ->.;
##D   do.call("rbind", .) ->.;
##D   .[.$Freq > 0, ] ->.;
##D   within(., {
##D     landform = reorder(factor(landform), Freq, max)
##D     geompos  = reorder(factor(geompos),  Freq, max)
##D     geompos  = factor(geompos, levels = rev(levels(geompos)))
##D   }) ->.;
##D   }
##D test$Freq2 <- cut(test$Freq, 
##D                   breaks = c(0, 5, 10, 25, 50, 100, 150),
##D                   labels = c("<5", "5-10", "10-25", "25-50", "50-100", "100-150")
##D                   )
##D ggplot(test, aes(x = geompos, y = landform, fill = Freq2)) + 
##D   geom_tile(alpha = 0.5) + facet_wrap(~ paste0(compname, "\n", drainagecl)) +
##D   viridis::scale_fill_viridis(discrete = T) +
##D   theme(aspect.ratio = 1, axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1)) +
##D   ggtitle("Landform vs 3-D Morphometry for Miami Major Components on SDA")
##D 
##D   
## End(Not run)



