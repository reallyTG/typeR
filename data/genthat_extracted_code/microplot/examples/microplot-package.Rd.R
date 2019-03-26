library(microplot)


### Name: microplot-package
### Title: Display microplots (sparklines) from R graphics panels in tables
###   in 'LaTeX', 'Word', 'HTML', 'Excel'.
### Aliases: microplot-package sparkline
### Keywords: package microplot sparkline LaTeX HTML Excel Sweave knitr
###   rmarkdown org-mode Word utilities lattice ggplot documentation xtable

### ** Examples

## This example writes a set of pdf files and then uses the latex
## function to display them in LaTeX.

## The graphs are constructed three times, once each with lattice,
## base graphics, and ggplot2.

## Not run: 
##D 
##D   ## 0. set options for pdflatex and pdf graphics files
##D   latexSetOptions()
##D 
##D 
##D   ## 1. define dataset
##D   tmp <- matrix(rnorm(10), 2, 5, byrow=TRUE,
##D                 dimnames=list(c("A", "B"), paste0("X", 1:5)))
##D 
##D   tmp.df <- data.frame(y=as.vector(t(tmp)),
##D                        group=factor(rep(row.names(tmp), each=5)))
##D   tmp.df
##D 
##D 
##D   ## 2. lattice example for latex and msWord
##D 
##D   tmp.lattice <- lattice::bwplot(group ~ y | " " * group, data=tmp.df, layout=c(1,2),
##D                                  as.table=TRUE, xlim=c(-2.1, 1.3),
##D                                  scales=list(y=list(relation="free", at=NULL)))
##D   tmp.lattice
##D 
##D 
##D   ## 3. using the latex.trellis method
##D   latex(tmp.lattice,
##D         height.panel=.3, width.panel=3, ## inches
##D         x.axis=TRUE, y.axis=FALSE,
##D         rowlabel="group", caption="latex.trellis of lattice graph column")
##D 
##D   latex(tmp.lattice, dataobject=formatDF(tmp, dec=2),
##D         height.panel=.3, width.panel=1.5, ## inches
##D         x.axis=FALSE, y.axis=FALSE,
##D         rowlabel="group", caption="latex.trellis of numeric data and lattice graph column")
##D 
##D 
##D   ## 4. MS Word example.  Uses functions in the flextable and officer packages.
##D 
##D   tmplw.docx <-
##D     msWord(tmp.lattice, dataobject=format(tmp, digits=2),
##D            height.panel=.3, width.panel=2, ## inches
##D            height.x.axis=.35, width.y.axis=.3,
##D            figPrefix="tmplw",
##D            y.axis=FALSE,
##D            rowlabel="group", width.rowname=.6,
##D            data.header="data values", width.dataobject=.6,
##D            graph.header="bwplot",
##D            caption="Lattice bwplot using msWord function")
##D   print.default(tmplw.docx)
##D   tmplw.docx  ## print method opens file
##D   ## cut and paste this graph into a larger .docx file.
##D 
##D 
##D   ## 5. ggplot2 example for latex and msWord
##D 
##D   library(ggplot2)
##D 
##D   tmpga.df <- cbind(tmp.df, fake="ff")
##D   tmpga <-
##D     ggplot(tmpga.df, aes(fake, y)) +
##D     geom_boxplot(outlier.size = 2) +
##D     facet_wrap(~ group, ncol=1) +
##D     coord_flip() + ylim(-2, 1.1)
##D   tmpga ## on interactive device
##D 
##D 
##D   ## 6. using the latex.ggplot method
##D 
##D   latex(tmpga, height.x.axis=.2, width.y.axis=.2, y.axis=FALSE)
##D 
##D   latex(tmpga, dataobject=formatDF(tmp, dec=2),
##D         height.panel=.5, height.x.axis=.2, width.y.axis=.2, y.axis=FALSE)
##D 
##D 
##D   ## 7. msWord with ggplot
##D 
##D   tmpga.docx <-
##D     msWord(tmpga, dataobject=format(tmp, digits=2),
##D            height.panel=.25, height.x.axis=.2, width.y.axis=.2, y.axis=FALSE,
##D            rowlabel="group", width.rowname=.6,
##D            data.header="data values", width.dataobject=.6,
##D            graph.header="bwplot",
##D            caption="ggplot2 boxplot using msWord function")
##D   print.default(tmpga.docx)
##D   tmpga.docx  ## print method opens file
##D 
##D 
##D   detach("package:ggplot2")
##D 
##D 
##D   ## 8. base graphics example
##D   ## This must be done with an explicit loop because
##D   ## base graphics doesn't produce a graphics object.
##D 
##D   dir.verify("tmpb")
##D   pdf("tmpb/fig%03d.pdf", onefile=FALSE, height=.5, width=3) ## inch
##D   par( bty="n", xaxt="n", omd=c(0,1, 0,1), mai=c(0,0,0,0))
##D   boxplot(tmp["A",], horizontal=TRUE, ylim=range(tmp)) ## ylim for horizontal plot
##D   boxplot(tmp["B",], horizontal=TRUE, ylim=range(tmp)) ## ylim for horizontal plot
##D   dev.off()
##D 
##D   tmpb.graphnames <- paste0("tmpb/fig", sprintf("%03i", 1:2), ".pdf")
##D 
##D   tmpb.display <-
##D     data.frame(round(tmp, 2),
##D                graphs=as.includegraphics(tmpb.graphnames, height="2em", raise="-1.4ex"))
##D   tmpb.display
##D 
##D   ## we are now using the latex.data.frame method in the Hmisc package
##D   tmpb.latex <- latex(tmpb.display, rowlabel="group",
##D                       caption="latex.default of base graphs")
##D   tmpb.latex$style <- "graphicx"
##D   tmpb.latex  ## this line requires latex in the PATH
##D 
##D 
##D   ## 9. detail for latex of lattice.  This is essentially what the
##D   ## latex.trellis method does all together.
##D 
##D   dir.verify("tmpl") ## create a new subdirectory of the working directory
##D   pdf("tmpl/fig%03d.pdf", onefile=FALSE, height=.5, width=2.5) ## inch
##D   update(tmp.lattice, layout=c(1,1), xlab="",
##D          par.settings=list(layout.heights=layoutHeightsCollapse(),
##D                            layout.widths=layoutWidthsCollapse(),
##D                            axis.line=list(col="transparent"),
##D                            strip.border=list(col="transparent")))
##D   dev.off()
##D 
##D   tmpl.graphnames <- paste0("tmpl/fig", sprintf("%03i", 1:2), ".pdf")
##D   names(tmpl.graphnames) <- rownames(tmp)
##D 
##D   tmpl <-
##D     as.includegraphics(tmpl.graphnames)
##D   ## retains dimensions from pdf() statement
##D   tmpl
##D   tmpl.latex <- latex(tmpl, rowlabel="group",
##D                       caption="latex.default of lattice graph column")
##D   tmpl.latex  ## this line requires latex in the PATH
##D 
##D   tmplw <-
##D     data.frame(round(tmp, 2),
##D                graphs=as.includegraphics(tmpl.graphnames, width="1in"))
##D   ## retains aspect ratio from pdf() statement
##D   tmplw
##D 
##D   tmplw.latex <- latex(tmplw, rowlabel="group",
##D                        caption="latex.default of numeric data and lattice graph column")
##D   tmplw.latex$style <- "graphicx"
##D   tmplw.latex  ## this line requires latex in the PATH
##D 
##D 
##D   ## 10. detail for latex of ggplot.
##D   ## left as an exercise.  It is very similar to the detail for latex with lattice.
##D 
## End(Not run)

## Please see the demos for more interesting examples.
## demo(package="microplot")




