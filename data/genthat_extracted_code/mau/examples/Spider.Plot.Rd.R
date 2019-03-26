library(mau)


### Name: Spider.Plot
### Title: Spider plot
### Aliases: Spider.Plot

### ** Examples

# Preparing data
library( data.table )
library( ggplot2 )
n<-10
m<-7
cols<-sample( colors()[ grepl('(red|blue|olive|darkgree)', colors() ) ], m, replace = TRUE )

data<-data.frame( grp = paste( 'A', sort( rep( 1:m, n ) ), sep = '' ),
                  cri = factor( rep( paste( 'c', 1:n, sep = '' ), m ), 
                                levels = paste( 'c', 1:n, sep = '' ), ordered = TRUE ),
                  val = runif( m * n ) )

data.label<-paste( 'A', 1:m,  ' class', sep = '' )
data.fill<-cols
data.color<-cols
data.linetype<-rep( 'solid', m )
data.alpha<-rep( 0.05, m )
data.size<-rep( 0.7, m )
data.label.color<-'black'
data.label.size<-15

# Spider plot parameters
title<-'Spider'
title.color<-'red3'
title.size<-20

label.size<-rep( 8, n )
label.color<-rep( 'steelblue4', n )
label.angle<-rep( 0, n )
label.position<-rep( 1.1, n )

theta<-pi/2

grid<-sort( c( 0.1, 0.25, 0.5, 0.75, 1.0 ) )
grid.color<-'grey'
grid.radius.color<-'dodgerblue3'
grid.linetype<-'dashed'
grid.size<-0.5
grid.radius.linetype<-'solid'
grid.radius.size<-0.5

axis<-grid # Same as grid
axis.label<-paste( 100 * axis, '%', sep = '' )
axis.color<-'black'
axis.size<-0.7
axis.linetype<-'solid'
axis.angle<-0.4*pi
axis.label.color<-'darkgreen'
axis.label.size<-5
axis.label.displace<- -0.07
axis.label.angle<-0

legend.position<-c(0.9, 0.9)
legend.size<-0.5
legend.text.color<-'black'

plot.margin<-unit( c( 1.0, 1.0, 1.0, 1.0 ),"cm")


p<-Spider.Plot( data,
                data.label,
                data.fill,
                data.color,
                data.linetype,
                data.alpha,
                data.size,
                data.label.color, 
                data.label.size,
                grp,
                cri,
                val, 
                title,
                title.color,
                title.size,
                label.size, 
                label.color,
                label.angle,
                label.position,
                theta, 
                grid, 
                grid.color, 
                grid.radius.color,
                grid.linetype, 
                grid.size, 
                grid.radius.linetype, 
                grid.radius.size, 
                axis, 
                axis.label,
                axis.color,
                axis.size, 
                axis.linetype, 
                axis.angle, 
                axis.label.color,
                axis.label.size, 
                axis.label.displace,
                axis.label.angle,
                legend.position,
                legend.size,
                legend.text.color,
                plot.margin )

plot(p)



