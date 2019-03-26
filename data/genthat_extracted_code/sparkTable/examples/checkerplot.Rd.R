library(sparkTable)


### Name: checkerplot
### Title: Checkerplot
### Aliases: checkerplot

### ** Examples

## Not run: 
##D ### Directory of the package with flags
##D dirflags = paste(searchpaths()[grep("sparkTable", searchpaths())], "/etc/Flaggen/",
##D   sep="")
##D ### EXAMPLE for EUROPE
##D   data(EU_data)
##D   order_eu = optimal_grid_allocation(EU_data[,16:17],8,7)
##D   colnames(EU_data)[1] <- c("country")
##D   EU_data[,18] <- order_eu
##D   colnames(EU_data)[1] <- c("country")
##D   colnames(EU_data)[18] <- c("order")
##D   data_eu = data.frame(cbind(rep(1997,34)), EU_data$unempl_f_1997, EU_data$country,
##D     EU_data$order)
##D   colnames(data_eu) = c("x", "y", "names", "order")
##D   for(year in 1998:2008){
##D     XX <- data.frame(cbind(rep(year,34)), EU_data[,paste("unempl_f_",year,sep="")],
##D       EU_data$country, EU_data$order)
##D     colnames(XX) = c("x", "y", "names", "order")
##D     data_eu = rbind(data_eu,XX)
##D   }
##D dirflags_eu=paste(dirflags,"EU/",sep="")
##D checkerplot(data_eu, cols=8, rows=7, geom="line", img=dirflags_eu,
##D             title = "Unemployment rate in Europe 1997 to 2008 (in perc)", title.size=18,
##D             ylabels=c(5,10,15,20),
##D       ybreaks=c(5,10,15,20), xbreaks=c(1998,2001,2004,2007),
##D       xlabels=c("98","01","04","07"),
##D         margin_yaxis=-0.05, margin_yaxis2=-0.2,
##D         margin_xaxis=-0.4, margin_xaxis2=0 )
##D 
##D ### EXAMPLE for US data
##D   data(coordUS)
##D   ## rearrange states which are far away:
##D   coordUS[coordUS$state=="AK","x"] <- 0.4  ## rearrange Alaska
##D   coordUS[coordUS$state=="HI","x"] <- 0.5       ## rearrange Hawaii
##D   ## optimal arrangement of the states:
##D   order <- optimal_grid_allocation(coordUS[,1:2],13,6)
##D   order <- data.frame(names=coordUS$state,order=order)
##D   ## load US healthy insurance data
##D   data(USdata1)
##D   data(USdata2)
##D   nam <- names(USdata1)
##D   ## delete previous order (optional)
##D   USdata1 <- USdata1[,-which(names(USdata1)=="order")]
##D   ## combine data and ordering:
##D   USdata1 <- merge(USdata1,order,all.x=TRUE,all.y=FALSE)
##D #  USdata1[is.na(USdata1$order),"order"] <- 14
##D   USdata1 <- USdata1[,nam]
##D   ## define directory with flags (pnm's):
##D   dirflags_us=paste(dirflags,"USStates/",sep="")
##D   USdata2[,3] <- USdata2[,3]*100
##D   checkerplot(USdata2[,-2], cols=13, rows=6, geom="bar",
##D             title="US private health insurance (in percent of the population)",
##D             title.size=18, ylabels=c(30,60,90), ybreaks=c(30,60,90),
##D             img=dirflags_us, margin_yaxis=-0.05, margin_yaxis2=-0.2,
##D         margin_xaxis=-0.4, margin_xaxis2=0)
## End(Not run)



