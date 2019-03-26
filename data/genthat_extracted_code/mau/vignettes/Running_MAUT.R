## ---- eval=TRUE----------------------------------------------------------
library( mau )
file<-system.file("extdata", "utilities.txt", package = "mau" )
lines<-readLines( file )
for ( i in 1:length( lines ) ) { 
  cat( lines[i], '\n' )
}

## ----eval=TRUE,message=FALSE, warning=FALSE------------------------------
library( mau )
library( data.table )
library( igraph )
library( ggplot2 )

## ----eval=TRUE-----------------------------------------------------------
index<-data.table( cod = paste( 'A', 1:10, sep = '' ), 
                   i1 = c( 0.34, 1, 1, 1, 1, 0.2, 0.7, 0.5, 0.11, 0.8 ),
                   i2 = c( 0.5, 0.5, 1, 0.5, 0.3, 0.1, 0.4, 0.13, 1, 0.74 ), 
                   i3 = c( 0.5, 1.0, 0.75, 0.25, 0.1, 0.38, 0.57, 0.97, 0.3, 0.76 ),
                   i4 = c( 0, 0.26, 0.67, 0.74, 0.84, 0.85, 0.74, 0.65, 0.37, 0.92 ) )

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable( index )

## ----eval=TRUE-----------------------------------------------------------
file<-system.file("extdata", "utilities.txt", package = "mau" )
script<-'utilities.R'
lines<-17
skip<-2
encoding<-'utf-8'
functions<-Read.Utilities( file, script, lines, skip, encoding )
source( 'utilities.R' )

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable( functions )

## ----eval=TRUE-----------------------------------------------------------
# Index positions
columns<-c( 2, 3, 4, 5 )

# Function names
functions<-sapply( c( 'Project', 
                      'Self implementation',
                      'External and local relations', 
                      'Scope of capabilities' ),
                   FUN = Stand.String )
names( functions )<-NULL

# Evaluation of utilities
utilities<-Eval.Utilities( index, columns, functions )

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable( utilities )

## ----eval=TRUE, fig.show='hold', fig.align="center", fig.width=7, fig.height=6----
file<-system.file("extdata", "tree.csv", package = "mau" )
tree.data<-Read.Tree( file, skip = 0, nrow = 8 )
tree<-Make.Decision.Tree( tree.data )
utilities<-Eval.Utilities( index, columns, functions )

plot( tree, layout = layout_as_tree )

## ----eval=TRUE-----------------------------------------------------------
weights<-tree.data[ !is.na( weight ) ]$weight
model<-Compute.Model( tree, utilities, weights )

## ----eval=TRUE, fig.show='hold', fig.align="center", fig.width=7, fig.height=4----
xlab<-'Utility'
ylab<-'Institutions'
title<-'Criteria utilities'

colors<-c( 'dodgerblue4', 'orange', 'gold', 'red3' )
deep<-2
bar<-Bar.Plot( model, deep, colors, title, xlab, ylab )
plot( bar )

## ----eval=TRUE, fig.show='hold', fig.show='hold', fig.align="center", fig.width=7, fig.height=4----
n<-800
alpha<-c( 0.2, 0.5, 0.1, 0.2 )
constraints<-list( list( c(1,2), 0.7 ), 
                   list( c(3,4), 0.3 ) )
S<-Sim.Const.Weights( n, utilities, alpha, constraints )
plot.S<-Plot.Simulation.Weight( S$simulation, title = 'Simulations', 
                                xlab = 'ID', ylab = 'Utility' ) 

plot( plot.S )

