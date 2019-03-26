library(Rnets)


### Name: plot,rnetBasic-method
### Title: Plot methods for R-nets
### Aliases: plot,rnetBasic-method plot

### ** Examples


#Create Rnet object
R_EC_08 <- Rnet(x = NARMS_EC_DATA,
  L1 = 0.15,
  vertices = c('AMP', 'AMC','FOX', 'TIO', 'AXO', 'CIP', 'NAL', 'TET', 'COT', 'FIS'),
  subset = expression(Year == 2008)
  )

#Plot the network without decoration
plot(R_EC_08)

#View the function call and use it to plot the network with plot.igraph() 
plot_call <- plot(R_EC_08, draw_plot = FALSE)
plot_call
eval(parse(text = plot_call))

#Decorate the graph using igraph plotting arguments
plot_call_decorated <- plot(R_EC_08, vertex.shape = 'square', vertex.color = 'cyan', edge.width = 3)
plot_call_decorated

#Decorate the graph using Assign_Vmetadata() and Assign_Emetadata()
Assign_Emetadata(R_EC_08, E_ATTRS, 'omega', e_cuts = c(0, 0.05, 0.10, 0.20, 1))
Assign_Vmetadata(R_EC_08, V_ATTRS, 'Code')

plot_call_metadata <- plot(R_EC_08, vertex.frame.color = NA)
plot_call_metadata

#Override a previously assigned graphical attribute (vertex.color)
plot_call_metadata <- plot(R_EC_08, vertex.frame.color = NA, vertex.color = c('red', 'green'))
plot_call_metadata



