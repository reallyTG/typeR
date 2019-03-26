library(textshape)


### Name: cluster_matrix
### Title: Reorder a Matrix Based on Hierarchical Clustering
### Aliases: cluster_matrix

### ** Examples

cluster_matrix(mtcars)
cluster_matrix(mtcars, dim = 'row')
cluster_matrix(mtcars, dim = 'col')

## Not run: 
##D if (!require("pacman")) install.packages("pacman")
##D pacman::p_load(tidyverse, viridis, gridExtra)
##D 
##D ## plot heatmap w/o clustering
##D wo <- mtcars %>%
##D     cor() %>%
##D     tidy_matrix('car', 'var') %>%
##D     ggplot(aes(var, car, fill = value)) +
##D          geom_tile() +
##D          scale_fill_viridis(name = expression(r[xy])) +
##D          theme(
##D              axis.text.y = element_text(size = 8)   ,
##D              axis.text.x = element_text(
##D                  size = 8, 
##D                  hjust = 1, 
##D                  vjust = 1, 
##D                  angle = 45
##D              ),   
##D              legend.position = 'bottom',
##D              legend.key.height = grid::unit(.1, 'cm'),
##D              legend.key.width = grid::unit(.5, 'cm')
##D          ) +
##D          labs(subtitle = "With Out Clustering")
##D 
##D ## plot heatmap w clustering
##D w <- mtcars %>%
##D     cor() %>%
##D     cluster_matrix() %>%
##D     tidy_matrix('car', 'var') %>%
##D     mutate(
##D         var = factor(var, levels = unique(var)),
##D         car = factor(car, levels = unique(car))        
##D     ) %>%
##D     group_by(var) %>%
##D     ggplot(aes(var, car, fill = value)) +
##D          geom_tile() +
##D          scale_fill_viridis(name = expression(r[xy])) +
##D          theme(
##D              axis.text.y = element_text(size = 8)   ,
##D              axis.text.x = element_text(
##D                  size = 8, 
##D                  hjust = 1, 
##D                  vjust = 1, 
##D                  angle = 45
##D              ),   
##D              legend.position = 'bottom',
##D              legend.key.height = grid::unit(.1, 'cm'),
##D              legend.key.width = grid::unit(.5, 'cm')               
##D          ) +
##D          labs(subtitle = "With Clustering")
##D 
##D gridExtra::grid.arrange(wo, w, ncol = 2)
## End(Not run)



