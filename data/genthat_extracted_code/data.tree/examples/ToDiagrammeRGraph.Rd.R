library(data.tree)


### Name: plot.Node
### Title: Plot a graph, or get a graphviz dot representation of the tree
### Aliases: plot.Node ToDiagrammeRGraph SetNodeStyle SetEdgeStyle
###   SetGraphStyle GetDefaultTooltip

### ** Examples

data(acme)
SetGraphStyle(acme, rankdir = "TB")
SetEdgeStyle(acme, arrowhead = "vee", color = "blue", penwidth = 2)
#per default, Node style attributes will be inherited:
SetNodeStyle(acme, style = "filled,rounded", shape = "box", fillcolor = "GreenYellow", 
             fontname = "helvetica", tooltip = GetDefaultTooltip)
SetNodeStyle(acme$IT, fillcolor = "LightBlue", penwidth = "5px")
#inheritance can be avoided:
SetNodeStyle(acme$Accounting, inherit = FALSE, fillcolor = "Thistle", 
             fontcolor = "Firebrick", tooltip = "This is the accounting department")
SetEdgeStyle(acme$Research$`New Labs`, 
             color = "red", 
             label = "Focus!", 
             penwidth = 3, 
             fontcolor = "red")
#use Do to set style on specific nodes:
Do(acme$leaves, function(node) SetNodeStyle(node, shape = "egg"))
plot(acme)

#print p as label, where available:
SetNodeStyle(acme, label = function(node) node$p)
plot(acme)




