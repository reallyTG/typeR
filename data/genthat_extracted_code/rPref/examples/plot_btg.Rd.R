library(rPref)


### Name: plot_btg
### Title: Better-Than-Graphs
### Aliases: get_btg get_btg_dot plot_btg

### ** Examples


# pick a small data set and create preference and BTG 
df <- mtcars[1:10,]
pref <- high(mpg) * low(wt)

# directly plot the BTG with row numbers as labels
# uses Rgraphviz if available and igraph otherwise
plot_btg(df, pref) 

# plot the graph with labels with relevant values
labels <- paste0(df$mpg, "; ", df$wt)
plot_btg(df, pref, labels)
     
# show lattice structure of 3-dimensional Pareto preference
df <- merge(merge(data.frame(x = 1:3), data.frame(y = 1:3)), data.frame(z = 1:2))
labels <- paste0(df$x, ",", df$y, ",", df$z)
plot_btg(df, low(x) * low(y) * low(z), labels)
     
# Create a graph with external Graphviz (requires installed Graphviz)
## Not run: 
##D # creates tmpgraph.dot in the current working directoy
##D get_btg_dot(df, pref, labels, file = "tmpgraph.dot")
##D # convert to diagram tmpgraph.png using Graphviz
##D shell(paste0('"C:/Program Files (x86)/Graphviz2.38/bin/dot.exe"',
##D              ' -Tpng tmpgraph.dot -o tmpgraph.png'))
##D # open resulting image
##D shell("tmpgraph.png")
## End(Not run)




