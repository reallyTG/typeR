library(dendextend)


### Name: ggdend
### Title: Creates dendrogram plot using ggplot.
### Aliases: ggdend as.ggdend as.ggdend.dendrogram prepare.ggdend
###   ggplot.ggdend ggplot.dendrogram print.ggdend

### ** Examples


## Not run: 
##D 
##D library(dendextend)
##D # library(ggdendro)
##D # Create a complex dend:
##D dend <- iris[1:30,-5] %>% dist %>% hclust %>% as.dendrogram %>% 
##D    set("branches_k_color", k=3) %>% set("branches_lwd", c(1.5,1,1.5)) %>% 
##D    set("branches_lty", c(1,1,3,1,1,2)) %>%  
##D    set("labels_colors") %>% set("labels_cex", c(.9,1.2)) 
##D # plot the dend in usual "base" plotting engine:   
##D plot(dend)
##D # Now let's do it in ggplot2 :)
##D ggd1 <- as.ggdend(dend)
##D library(ggplot2)
##D ggplot(ggd1) # reproducing the above plot in ggplot2 :)
##D 
##D 
##D labels(dend) <- paste0(labels(dend), "00000")
##D ggd1 <- as.ggdend(dend)
##D # Use ylim to deal with long labels in ggplot2
##D ggplot(ggd1) + ylim(-.4, max(get_branches_heights(dend)) )
##D 
##D 
##D ggplot(ggd1, horiz = TRUE) # horiz plot in ggplot2
##D # Adding some extra spice to it...
##D # creating a radial plot:
##D ggplot(ggd1) + scale_y_reverse(expand = c(0.2, 0)) + coord_polar(theta="x") 
##D # The text doesn't look so great, so let's remove it:
##D ggplot(ggd1, labels = FALSE) + scale_y_reverse(expand = c(0.2, 0)) + coord_polar(theta="x") 
##D 
##D # This can now be sent to plot.ly - which adds zoom-in abilities, and more.
##D # Here is how it might look like: https://plot.ly/~talgalili/6/y-vs-x/
##D 
##D ## Quick guide:
##D # install.packages("devtools")
##D # library("devtools")
##D # devtools::install_github("ropensci/plotly")
##D # library(plotly)
##D # set_credentials_file(...) 
##D # you'll need to get it from here: https://plot.ly/ggplot2/getting-started/
##D 
##D # ggplot(ggd1)
##D # py <- plotly()
##D # py$ggplotly()
##D 
##D # And you'll get something like this: https://plot.ly/~talgalili/6/y-vs-x/
##D 
##D # Another example: https://plot.ly/ggplot2/
##D 
## End(Not run)



