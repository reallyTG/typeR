library(d3r)


### Name: d3_v8
### Title: Create V8 Context with D3
### Aliases: d3_v8

### ** Examples

## Not run: 
##D 
##D # to do this all in R, please see ggraph
##D # https://github.com/thomasp85/ggraph
##D # by Thomas Lin Pedersen
##D library(d3r)
##D 
##D # make a simple data.frame of US state data
##D states <- data.frame(
##D   region = as.character(state.region),
##D   state = as.character(state.abb),
##D   population = state.x77[,"Population"],
##D   stringsAsFactors = FALSE
##D )
##D 
##D # use d3_nest to get the data.frame in a d3 hierarchy
##D state_hier <- d3_nest(
##D   states,
##D   value_cols = "population"
##D )
##D 
##D # use d3_v8 to do something useful with d3 and, our state data
##D ctx <- d3_v8()
##D ctx$eval(sprintf(
##D   " var states = %s",
##D   state_hier
##D ))
##D ctx$eval(
##D "
##D // we assigned the variable states above
##D //  so now make it a real d3 hierarchy
##D var root = d3.hierarchy(states);
##D 
##D // sum on population
##D root.sum(function(d) {return d.population ? d.population : 0});
##D 
##D 
##D // use d3 to circle pack or state hierarchy
##D d3.pack()(root);
##D 
##D // get something we can convert into a data.frame in R
##D var states_packed = [];
##D root.each(function(d) {
##D   states_packed.push({
##D     name: d.data.name,
##D     radius: d.r,
##D     x: d.x,
##D     y: d.y
##D   });
##D });
##D "
##D )
##D 
##D # now get states_packed from our context
##D #  to plot in R
##D states_packed <- ctx$get("states_packed")
##D opar <- par(no.readonly=TRUE)
##D # make it square
##D par(pty="s")
##D symbols(
##D   states_packed$x,
##D   states_packed$y,
##D   states_packed$radius,
##D   inches=FALSE,
##D   asp=1
##D )
##D text(y~x, data=states_packed, labels=states_packed$name)
##D # return to original par before we made it square
##D par(opar)
##D 
##D # d3.quadtree example
##D 
##D library(d3r)
##D 
##D x = runif(100)
##D y = runif(100)
##D 
##D ctx <- d3_v8()
##D # assign pts as array of pts in V8
##D ctx$assign("pts", matrix(c(x,y),ncol=2,byrow=TRUE))
##D # use d3.quadtree() to plot rects
##D ctx$eval(
##D   "
##D   var d3q = d3.quadtree()
##D   .addAll(pts);
##D   // nodes function from https://bl.ocks.org/mbostock/4343214
##D   function nodes(quadtree) {
##D   var nodes = [];
##D   quadtree.visit(function(node, x0, y0, x1, y1) {
##D   nodes.push({x0:x0, y0:y0, x1: x1, y1: y1})
##D   });
##D   return nodes;
##D   }
##D   "
##D )
##D 
##D nodes <- ctx$get("nodes(d3q)", simplifyVector = FALSE)
##D # draw points
##D opar <- par(no.readonly=TRUE)
##D # make it square
##D par(pty="s")
##D plot(y~x)
##D # draw quadtree rects
##D rect(
##D   lapply(nodes,function(x){x$x0}),
##D   lapply(nodes,function(x){x$y0}),
##D   lapply(nodes,function(x){x$x1}),
##D   lapply(nodes,function(x){x$y1})
##D )
##D par(opar)
## End(Not run)



