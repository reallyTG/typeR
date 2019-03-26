library(svgPanZoom)


### Name: svgPanZoom
### Title: Pan and Zoom R graphics
### Aliases: svgPanZoom

### ** Examples

#  svgPanZoom tries to be very flexible with its first argument

#  in this first example use SVG as a character string
#    this is probably the least likely use case
library(svgPanZoom)
svgPanZoom('
   <svg style="height:300px;width:300px;">
     <circle cx="60" cy="60" r="50" style="fill:none;stroke:blue;"/>
   </svg>
')


## Not run: 
##D library(svgPanZoom)
##D 
##D # first let's demonstrate a base plot
##D # use svglite for now
##D library(svglite)
##D library(lattice)
##D svgPanZoom( svglite:::inlineSVG( plot(1:10) ) )
##D 
##D svgPanZoom(svglite:::inlineSVG(show( xyplot( y~x, data.frame(x=1:10,y=1:10) ) )))
##D 
##D # the package gridSVG is highly recommended for lattice and ggplot2
##D # second let's demonstrate a lattice plot
##D library(lattice)
##D svgPanZoom( xyplot( y~x, data.frame(x=1:10,y=1:10) ) )
##D 
##D # third with a ggplot2 plot
##D library(ggplot2)
##D svgPanZoom( ggplot( data.frame(x=1:10,y=1:10), aes(x=x,y=y) ) + geom_line() )
##D 
##D #Of course as a good htmlwidget should, it works with Shiny also.
##D library(shiny)
##D library(svglite)
##D library(svgPanZoom)
##D library(ggplot2)
##D 
##D ui <- shinyUI(bootstrapPage(
##D   svgPanZoomOutput(outputId = "main_plot")
##D ))
##D 
##D server = shinyServer(function(input, output) {
##D   output$main_plot <- renderSvgPanZoom({
##D     p <- ggplot() +
##D      geom_point(
##D        data=data.frame(faithful),aes(x=eruptions,y=waiting)
##D      ) +
##D      stat_density2d(
##D        data=data.frame(faithful)
##D        ,aes(x=eruptions,y=waiting ,alpha =..level..)
##D        ,geom="polygon") +
##D      scale_alpha_continuous(range=c(0.05,0.2))
##D 
##D      svgPanZoom(p, controlIconsEnabled = T)
##D   })
##D })
##D 
##D runApp(list(ui=ui,server=server))
## End(Not run)




