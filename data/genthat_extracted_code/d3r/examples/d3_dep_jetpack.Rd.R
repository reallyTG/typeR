library(d3r)


### Name: d3_dep_jetpack
### Title: 'd3.js' Dependency for Version 4 Jetpack
### Aliases: d3_dep_jetpack

### ** Examples

## Not run: 
##D 
##D library(d3r)
##D library(htmltools)
##D 
##D tl <- tagList(tags$script(HTML(sprintf(
##D "
##D var x = 5;
##D 
##D var svg = d3.select('body')
##D     .append('svg');
##D 
##D svg.append('rect')
##D     .at({
##D         x: 100,
##D         y: 100,
##D         width: 100,
##D         height: 100
##D     })
##D     .st({
##D         fill: 'blue',
##D         stroke: 'purple'
##D     });
##D "
##D ))), d3_dep_v4(), d3_dep_jetpack())
##D browsable(tl)
##D 
##D 
##D 
##D tl <- tagList(tags$script(HTML(sprintf(
##D  "
##D  var svg = d3.select('body')
##D      .append('svg');
##D 
##D  test_data = [{x: 250, y: 250}, {x: 300, y: 300}, {x: 300, y: 100}];
##D 
##D  svg.appendMany(test_data, 'circle')
##D      .at({
##D          cx: function(d){return d.x},
##D          cy: function(d){return d.y},
##D          r: 50
##D      })
##D      .st({
##D          fill: 'purple',
##D          stroke: 'blue'
##D      });
##D  "
##D ))), d3_dep_v4(), d3_dep_jetpack())
##D 
##D browsable(tl)
##D 
## End(Not run)



