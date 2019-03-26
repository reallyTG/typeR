library(loa)


### Name: 4.1.panel.pal
### Title: panelPal
### Aliases: 4.1.panel.pal panelPal.old panelPal loaHandler
### Keywords: methods

### ** Examples


## the combination of panelPal and specially 
## structured panel... functions provides 
## several additional plot features:

## example 1
## plot management from the panel... functions.

# loaHandler can used to see if a panel is loa-friendly

loaHandler(panel.xyplot)  #FALSE
loaHandler(panel.loaPlot) #panel defaults

# note that these include a list called 
# default.settings. These are settings that are  
# automatically added to the plot call.

# Here this assigns a specialist key to that 
# panel. However, the same mechanism can also 
# be used to turn off plot elements like the 
# standard lattice axes, when using in panel 
# alternatives

# first some silly data

a <- rnorm(1000)
b <- rnorm(1000)

# now compare:  

# default plot 
# note bubble plot style key

loaPlot(a~a*b) 

# bin plot
# with classic color key

loaPlot(a~a*b, panel = panel.binPlot) 

 
## example 2
## automatic subscripting with loa

# Other arguments are not automatically 
# aligned with the main plots. 

# For example, consider the data:

a <- 1:10
ref <- rep(1:2, each=5)

# and associated lattice xyplot output:

xyplot(a~a|ref, col=ref, pch=19)

# Here, the 'col' argument does not 
# automatically track plot conditioning. 

# With lattice plots you need to assign
# arguments you want to track in this 
# manner using subscripts, as discussed 
# in Lattice Chapter 5.

# Now compare a similar loaPlot:

loaPlot(~a*a|ref, col=ref, pch=19)

# Here, panelPal automatically handles 
# such subscripting. It extends this 
# assumption to all supplied arguments.  

# For example, try
## Not run: 
##D   loaPlot(~a*a|ref, col=ref, pch=ref)
##D   loaPlot(~a*a|ref, col=ref, pch=1:10)
## End(Not run)




