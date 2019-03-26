library(micromap)


### Name: lmgroupedplot
### Title: Linked Micromaps
### Aliases: lmgroupedplot lmplot mmgroupedplot mmplot lmplot mmgroupedplot
###   lmgroupedplot mmplot.SpatialPolygonsDataFrame mmplot.default
### Keywords: hplot

### ** Examples

# initial example

data("USstates")
head(USstates@data)
statePolys <- create_map_table(USstates, 'ST')
head(statePolys)

data("edPov")

# basic figure 1
lmplot(stat.data = edPov,
  	map.data = statePolys,
	panel.types = c('labels', 'dot', 'dot','map'),
	panel.data = list('state','pov','ed', NA),
	ord.by = 'pov',   
	grouping = 5, median.row = TRUE,
	map.link = c('StateAb','ID'))

## Not run: 
##D # publication figure 1a
##D lmplot(stat.data = edPov,  map.data = statePolys ,
##D 	panel.types = c('labels', 'dot', 'dot','map'),
##D 	panel.data = list('state','pov','ed', NA),
##D 	ord.by = 'pov',  
##D 	grouping = 5, 
##D   	median.row = TRUE,
##D 	map.link = c('StateAb','ID'),
##D 	
##D   	plot.height = 9,							
##D 	colors = c('red','orange','green','blue','purple'), 
##D 	map.color2 = 'lightgray',
##D        
##D 	panel.att = list(
##D 	    list(1, header = 'States', panel.width = .8, align = 'left', 
##D 	      text.size = .9),
##D 			list(2, header = 'Percent Living Below \n Poverty Level',
##D 				graph.bgcolor = 'lightgray', point.size = 1.5,
##D 				xaxis.ticks = list(10,15,20), xaxis.labels = list(10,15,20),
##D 				xaxis.title = 'Percent'),
##D 			list(3, header = 'Percent Adults With\n4+ Years of College',
##D 				graph.bgcolor = 'lightgray', point.size = 1.5,
##D 				xaxis.ticks = list(0,20,30,40), xaxis.labels = list(0,20,30,40),
##D 				xaxis.title = 'Percent'),
##D 			list(4, header = 'Light Gray Means\nHighlighted Above',  
##D 				inactive.border.color = gray(.7), inactive.border.size = 2,	
##D 				panel.width = .8)))
##D 
##D edPov$points <- 0	
##D 
##D # publication figure 1b
##D lmplot (stat.data = edPov, map.data = statePolys,
##D 	panel.types = c('dot',  'labels', 'dot', 'dot', 'map'),
##D 	panel.data = list('points', 'state', 'pov', 'ed', NA),
##D 	map.link = c('StateAb','ID'),
##D 	ord.by = 'pov', 
##D 	grouping = 5, 
##D 	median.row = TRUE, 
##D 	
##D 	plot.height = 9, 
##D 	
##D 	colors = c('red','orange','green','blue','purple'),
##D 	map.color2 = 'lightgray', 
##D 
##D 	panel.att = list(list(1, panel.width = .15, point.type = 20,
##D 					graph.border.color = 'white',
##D 					xaxis.text.display = FALSE, xaxis.line.display = FALSE,
##D 					graph.grid.major = FALSE),
##D 	
##D 				list(2, header = 'States', panel.width = .8, 
##D 					align = 'left', text.size = .9),
##D 
##D 				list(3, header = 'Percent Living Below\nPoverty Level',
##D 					graph.bgcolor = 'lightgray', point.size = 1.5,
##D 					xaxis.ticks = list(10,15,20), 
##D 					xaxis.labels = list(10,15,20),
##D 					xaxis.title = 'Percent'),
##D 
##D 				list(4, header = 'Percent Adults With\n4+ Years of College',
##D 					graph.bgcolor = 'lightgray', point.size = 1.5,
##D 					xaxis.ticks = list(20,30,40), 
##D 					xaxis.labels = list(20,30,40), 
##D 					xaxis.title = 'Percent'),
##D 	
##D 				list(5, header = 'Light Gray Means\nHighlighted Above', 
##D 					inactive.border.color = gray(.7), inactive.border.size = 2, 
##D 					panel.width = .8)))
##D 
##D # publication figure 1c
##D myPlot <- lmplot(stat.data = edPov, map.data = statePolys,
##D 	panel.types = c('map', 'dot',  'labels', 'dot', 'dot'),
##D 	panel.data = list(NA, 'points', 'state', 'pov', 'ed'),
##D 	map.link = c('StateAb','ID'),
##D 	ord.by = 'pov', 
##D 	grouping = 5, 
##D 	median.row = TRUE,
##D 
##D 	plot.height = 9, 
##D 	
##D 	colors = c('red','orange','green','blue','purple'),
##D 	map.color2 = 'lightgray', 
##D 
##D 	panel.att = list(list(2, panel.width = .15, point.type = 20,
##D 				graph.border.color = 'white',
##D 				xaxis.text.display = FALSE, xaxis.line.display = FALSE,
##D 				graph.grid.major = FALSE),
##D 
##D 			list(3, header = 'States', panel.width = .8, 
##D 				align = 'left', text.size = .9),
##D 
##D 			list(4, header = 'Percent Living Below\nPoverty Level',
##D 				graph.bgcolor = 'lightgray', point.size = 1.5,
##D 				xaxis.ticks = list(10,15,20), xaxis.labels = list(10,15,20),
##D 				xaxis.title = 'Percent'),
##D 
##D 			list(5, header = 'Percent Adults With\n4+ Years of College',
##D 				graph.bgcolor = 'lightgray', point.size = 1.5,
##D 				xaxis.ticks = list(20,30,40), 
##D 				xaxis.labels = list(20,30,40), 
##D 				xaxis.title = 'Percent'),
##D 	
##D 			list(1, header = 'Light Gray Means\nHighlighted Above', 
##D 				inactive.border.color = gray(.7), inactive.border.size = 2, 
##D 				panel.width = .8)))
##D 
##D print(myPlot, name = 'myExhibit.tiff', res = 300)
## End(Not run)



