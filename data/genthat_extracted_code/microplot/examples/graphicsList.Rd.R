library(microplot)


### Name: graphicsList
### Title: Convert a list of "trellis" objects or list of "ggplot" objects
###   into a "graphicslist" object.
### Aliases: graphicsList
### Keywords: hplot

### ** Examples

## Not run: 
##D   latexSetOptions()
##D 
##D   ## graphicsList works the same for lattice and ggplot
##D 
##D   ## lattice
##D   tt <- data.frame(x=1:3, y=4:6, g=c("A","B","A"))
##D 
##D   ## t1 and t2: with key
##D   t1 <- lattice::xyplot(y ~ x, xlim=c(0,4), ylim=c(3,7), groups=g,
##D                         data=tt[1:2,], pch=19, col=2:3,
##D                         key=list(points=list(pch=19, col=2:3), text=list(levels(tt$g))))
##D 
##D   t2 <- lattice::xyplot(y ~ x, xlim=c(0,4), ylim=c(3,7), groups=g,
##D                         data=tt[3,  ], pch=19, col=2:3,
##D                         key=list(points=list(pch=19, col=2:3), text=list(levels(tt$g))))
##D 
##D   ## collapsed panels, no key
##D   latex(graphicsList(t1, t2), title="glt1", width.y.axis=.4, height.x.axis=.4)
##D 
##D   ## collapsed panels, one key
##D   latex(graphicsList(t1, t2), key=t1$legend$top$args$key, title="glt2",
##D         width.y.axis=.4, height.x.axis=.4)
##D 
##D   ## uncollapsed panels, one key per panel
##D   latex(graphicsList(list(t1, t2)), height.panel=2, width.panel=2, collapse=FALSE, title="glt1")
##D 
##D   ## uncollapsed panels, one key
##D   latex(graphicsList(list(update(t1, legend=NULL),
##D                           update(t2, legend=NULL))),
##D         height.panel=2, width.panel=2, collapse=FALSE,
##D         key=t1$legend$top$args$key, title="glt4")
##D 
##D 
##D   ## collapsed panels, no key
##D   msWord(graphicsList(matrix(list(t1, t2), 2, 1, dimnames=list(c("A","B"), "c"))),
##D          width.rowname=.5, title="Wt1", width.y.axis=.4, height.x.axis=.4)
##D 
##D   ## collapsed panels, one key
##D   msWord(graphicsList(matrix(list(t1, t2), 2, 1, dimnames=list(c("A","B"), "c"))),
##D          key=t1$legend$top$args$key,
##D          width.rowname=.5, title="Wt2", width.y.axis=.4, height.x.axis=.4)
##D 
##D   ## uncollapsed panels, one key per panel
##D   msWord(graphicsList(matrix(list(t1, t2), 2, 1, dimnames=list(c("A","B"), "c"))),
##D          height.panel=2, width.panel=2, collapse=FALSE,
##D          width.rowname=.5, title="Wt3")
##D 
##D   ## uncollapsed panels, one key
##D   msWord(graphicsList(matrix(list(update(t1, legend=NULL),
##D                                   update(t2, legend=NULL)),
##D                              2, 1, dimnames=list(c("A","B"), "c"))),
##D          height.panel=2, width.panel=2, collapse=FALSE,
##D          key=t1$legend$top$args$key,
##D          width.rowname=.5, title="Wt4")
##D 
##D 
##D   ## ggplot
##D   tt <- data.frame(x=1:3, y=4:6, g=c("A","B","A"))
##D 
##D   library(ggplot2)
##D 
##D   ## g1 and g2: with key
##D   g1 <-
##D     ggplot(tt[1:2,], aes(x,y, color=g)) +
##D     geom_point() +
##D     xlim(0,4) + ylim(3,7)
##D 
##D   g2 <-
##D     ggplot(tt[3,], aes(x,y, color=g)) +
##D     geom_point() +
##D     xlim(0,4) + ylim(3,7)
##D 
##D   g1key <- plot_grid(get_legend(g1))
##D 
##D   ## collapsed panels, no key
##D   latex(graphicsList(g1, g2), title="glg1", width.y.axis=.2, height.x.axis=.2)
##D 
##D   ## collapsed panels, one key
##D   latex(graphicsList(g1, g2), key=g1key, title="glg2", width.y.axis=.2, height.x.axis=.2)
##D 
##D   ## uncollapsed panels, one key per panel
##D   latex(graphicsList(list(g1, g2)), height.panel=2, width.panel=2, collapse=FALSE, title="glg3")
##D 
##D   ## uncollapsed panels, one key
##D   latex(graphicsList(list(g1+theme(legend.position="none"),
##D                           g2+theme(legend.position="none"))),
##D         height.panel=2, width.panel=2, collapse=FALSE,
##D         key=g1key, title="glg4")
##D 
##D   ## collapsed panels, no key
##D   msWord(graphicsList(g1, g2),
##D          width.rowname=.5, title="Wg1", width.y.axis=.4, ## width.y.axis=.2, ## not in R CMD check
##D          height.x.axis=.2,
##D          FlexTableWidths=c(.5, .45, 1))                  ## c(.5, .25, 1)    ## not in R CMD check
##D 
##D   ## collapsed panels, one key                           ## ditto
##D   msWord(graphicsList(g1, g2), key=g1key,
##D          width.rowname=.5, title="Wg2", width.y.axis=.4,
##D          height.x.axis=.2,
##D          FlexTableWidths=c(.5, .45, 1))
##D 
##D   ## uncollapsed panels, one key per panel
##D   msWord(graphicsList(list(g1, g2)), height.panel=2, width.panel=2, collapse=FALSE,
##D          width.rowname=.5, title="Wg3")
##D 
##D   ## uncollapsed panels, one key
##D   msWord(graphicsList(list(g1+theme(legend.position="none"),
##D                            g2+theme(legend.position="none"))),
##D          height.panel=2, width.panel=2, collapse=FALSE,
##D          key=g1key,
##D          width.rowname=.5, title="Wg4")
##D 
##D   detach("package:ggplot2") ## can't unload
##D 
## End(Not run)


