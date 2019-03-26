library(geoSpectral)


### Name: spc.plot.depth.plotly
### Title: Display a Spectra object
### Aliases: spc.plot.depth.plotly spc.plot.depth.plotly,Spectra-method

### ** Examples

sp = spc.example_spectra()
BL = spc.makeSpcList(sp,"CAST")
p1<-spc.plot.depth.plotly(BL[[5]])
#p1<-layout(p1,title=paste("CAST =", BL[[5]]$CAST[1]))
p2<-spc.plot.depth.plotly(BL[[4]])
#p2<-plotly::layout(p2,title=paste("CAST =", BL[[4]]$CAST[1]))
p <- plotly::subplot(p1, p2,  margin = 0.05, shareY=TRUE,shareX=TRUE,titleX=TRUE,titleY=TRUE)
p <- plotly::layout(p, showlegend = TRUE, 
annotations = list(
list(x = 0.2 , y = 1.05, text = BL[[5]]$CAST[1], showarrow = FALSE, xref='paper', yref='paper'),
list(x = 0.8 , y = 1.05, text = BL[[4]]$CAST[1], showarrow = FALSE, xref='paper', yref='paper')))
p



