library(sfsmisc)


### Name: ps.end
### Title: Close PostScript or Acrobat Graphics Device opened by 'ps.do' /
###   'pdf.do'
### Aliases: ps.end pdf.end
### Keywords: device

### ** Examples

if(interactive() ## Don't show: 
 || Sys.getenv("USER") == "maechler" 
## End(Don't show)
  ) {
    ps.do("ex.ps")
    data(sunspots)
    plot(sunspots)
    ps.end()

    pdf.latex("ex-sun.pdf")
    plot(sunspots)
    pdf.end(call. = FALSE) # basically the same as dev.off()
  }
  ps.latex("ex2.eps")
  plot(sunspots)
  ps.end(call.gv = FALSE) # basically the same as dev.off()



