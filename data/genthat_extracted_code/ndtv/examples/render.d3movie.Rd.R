library(ndtv)


### Name: render.d3movie
### Title: Render out a web-based animation of a networkDynamic object
###   using ndtv-d3 player app
### Aliases: render.d3movie

### ** Examples

# render an interactive SVG animation of short.stergm.sim and open it in a browser
data(short.stergm.sim)
render.d3movie(short.stergm.sim)

# render interactive widget in rmarkdown or RStudio plot window
render.d3movie(short.stergm.sim,output.mode='htmlWidget')

# render a static network as interactive SVG with lots of html tooltip info
data(emon)
render.d3movie(emon[[5]],
    vertex.tooltip=paste(emon[[5]]%v%'vertex.names',
      emon[[5]]%v%'Command.Rank.Score',
      emon[[5]]%v%'Sponsorship',
      sep="<br>"),
    edge.tooltip=paste('Frequency:',emon[[5]]%e%'Frequency'),
    edge.lwd='Frequency')

## Not run: 
##D 
##D 
##D # alternate code for embeding in rmarkdown
##D ```{r,results='asis'}
##D render.d3movie(short.stergm.sim,output.mode='inline')
##D ```
##D 
##D 
## End(Not run)




