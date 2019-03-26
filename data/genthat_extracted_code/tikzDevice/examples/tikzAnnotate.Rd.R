library(tikzDevice)


### Name: tikzAnnotate
### Title: Add Custom TikZ Code to an Active Device
### Aliases: tikzAnnotate tikzNode tikzCoord tikzAnnotateGrob tikzNodeGrob
###   tikzCoordGrob grid.tikzAnnotate grid.tikzNode grid.tikzCoord
### Keywords: annotation device tikz

### ** Examples


## Not run: 
##D 
##D ### Example 1: Annotations in Base Graphics
##D # Load some additional TikZ libraries
##D tikz("annotation.tex",width=4,height=4,
##D   packages = c(getOption('tikzLatexPackages'),
##D     "\\usetikzlibrary{decorations.pathreplacing}",
##D     "\\usetikzlibrary{positioning}",
##D     "\\usetikzlibrary{shapes.arrows,shapes.symbols}")
##D )
##D 
##D p <- rgamma (300 ,1)
##D outliers <- which( p > quantile(p,.75)+1.5*IQR(p) )
##D boxplot(p)
##D 
##D # Add named coordinates that other TikZ commands can hook onto
##D tikzCoord(1, min(p[outliers]), 'min outlier')
##D tikzCoord(1, max(p[outliers]), 'max outlier')
##D 
##D # Use tikzAnnotate to insert arbitrary code, such as drawing a
##D # fancy path between min outlier and max outlier.
##D tikzAnnotate(c("\\draw[very thick,red,",
##D   # Turn the path into a brace.
##D   'decorate,decoration={brace,amplitude=12pt},',
##D   # Shift it 1em to the left of the coordinates
##D   'transform canvas={xshift=-1em}]',
##D   '(min outlier) --',
##D   # Add a node with some text in the middle of the path
##D   'node[single arrow,anchor=tip,fill=white,draw=green,',
##D   'left=14pt,text width=0.70in,align=center]',
##D   '{Holy Outliers Batman!}', '(max outlier);'))
##D 
##D # tikzNode can be used to place nodes with customized options and content
##D tikzNode(
##D   opts='starburst,fill=green,draw=blue,very thick,right=of max outlier',
##D   content='Wow!'
##D )
##D 
##D dev.off()
##D 
##D 
##D ### Example 2: Annotations in Grid Graphics
##D library(grid)
##D 
##D tikz("grid_annotation.tex",width=4,height=4,
##D   packages = c(getOption('tikzLatexPackages'),
##D     "\\usetikzlibrary{shapes.callouts}")
##D )
##D 
##D pushViewport(plotViewport())
##D pushViewport(dataViewport(1:10, 1:10))
##D 
##D grid.rect()
##D grid.xaxis()
##D grid.yaxis()
##D grid.points(1:10, 1:10)
##D 
##D for ( i in seq(2,8,2) ){
##D   grid.tikzNode(i,i,opts='ellipse callout,draw,anchor=pointer',content=i)
##D }
##D 
##D dev.off()
##D 
## End(Not run)





