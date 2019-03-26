library(dprint)


### Name: ftr
### Title: Footer
### Aliases: ftr

### ** Examples

## No test: 
longtable1 <- rdesc(15, 7)
longtable2 <- rdesc(7, 4)
h <- expression(hdr("Multiple Page Report",
                pagelayout.obj=pagelayout(dtype="landscape", margins=c(.75, .5))))
f <- expression(ftr("R Package tabulaR",
                pagelayout.obj=pagelayout(dtype="landscape", margins=c(.75, .5))
                , pagenum=eval.parent(pagenum, 1)
                ))
               
 pdf("longtable1.pdf", height=8.5, width=11)
    dp <- dprint(fmla= group+level~ `This is a Control`:(Mean1 + Variance1) +
    Treatment:(Mean2 + Variance2)+p.value,
          data=longtable1, showmargins=TRUE, dtype="landscape",
          newpage=TRUE, pagenum=1, margins=1,
          f.hdr=h, f.ftr=f
          )
   
   dprint(fmla= group+level~ `This is a Control`:(Mean1 + Variance1) + 
   Treatment:(Mean2 + Variance2)+p.value,
          data=longtable2, showmargins=TRUE, dtype="landscape",
          newpage=TRUE, lastcall=dp, # Pick up with page numbering
          margins=1,
          f.hdr=h, f.ftr=f
          )
  x <- rnorm(100)
  y <- rnorm(100)
  f2 <- expression(ftr("R Package tabulaR",
                pagelayout.obj=pagelayout(dtype="landscape", margins=c(.5, .5))
                , pagenum=dp$pagenum+1
                )) 
## End(No test)
  # par(mai=c(2,3,2,3))
  ## No test: 
plot(x,y, main="Scatter Plot X vs. Y")
  eval(f2)
  eval(h)
## End(No test)
  ## No test: 
par(mfcol=c(1,2), pty="s", bg="grey", mai=c(1,1,1,1))
  plot(density(x), "Distribution of X", xlab="x", bg="blue")
  plot(x,y, main="Scatter Plot X vs. Y")
  eval(f2)
  eval(h)
  dev.off()
## End(No test)



