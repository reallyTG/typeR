library(sfsmisc)


### Name: ps.latex
### Title: PostScript/PDF Preview Device with Optional 'LaTeX' Touch
### Aliases: pdf.do pdf.latex ps.do ps.latex
### Keywords: device

### ** Examples

if(interactive()) {

 ps.latex("ps.latex-ex.ps", main= TRUE)
  data(sunspots)
  plot(sunspots,main=paste("Sunspots Data, n=",length(sunspots)),col="red")
 ps.end()

 pdf.latex("pdf.latex-ex.pdf", main= TRUE)
  data(sunspots)
  plot(sunspots,main=paste("Sunspots Data, n=",length(sunspots)),col="red")
 pdf.end()

 ps.do("ps_do_ex.ps")
   example(plot.function)
 ps.end()

 pdf.do("pdf_do_ex.pdf", width=12, height=5)
   plot(sunspots, main="Monthly Sunspot numbers (in Zurich, then Tokyo)")
 pdf.end()
}



