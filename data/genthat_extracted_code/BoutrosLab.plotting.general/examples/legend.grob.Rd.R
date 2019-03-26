library(BoutrosLab.plotting.general)


### Name: legend.grob
### Title: Generate a legend grob
### Aliases: legend.grob

### ** Examples

## Not run: 
##D # create list representing two legends
##D legends1 <- list(
##D     legend = list(
##D         colours = c('orange', 'chartreuse4', 'darkorchid4'),
##D         labels = c('Group 1', 'Group 2', 'Group 3'),
##D         border = c('orange', 'chartreuse4', 'darkorchid4'),
##D         title = 'Legend #1'
##D         ),
##D     legend = list(
##D         colours = c('firebrick3', 'lightgrey'),
##D         labels = c('Case', 'Control')
##D         )
##D     );
##D 
##D # create a legend grob using defaults
##D legend.grob1 <- legend.grob(
##D     legends = legends1
##D     );
##D tiff(
##D     file.path(tempdir(),'legend_grob1.tiff'), 
##D     type = 'cairo', 
##D     width = 5, 
##D     height = 5, 
##D     units = 'in', 
##D     res = 800, 
##D     compression = 'lzw'
##D     );
##D grid.draw(legend.grob1);
##D dev.off();
##D 
##D # create the same legend with some customizations
##D legend.grob2 <- legend.grob(
##D     legends = legends1,
##D     label.cex = 1.25,
##D     title.cex = 1.25,
##D     title.just = 'left',
##D     title.fontface = 'bold.italic',
##D     size = 4,
##D     border = list(),
##D     layout = c(2,1)
##D     );
##D tiff(
##D     file.path(tempdir(),'legend_grob2.tiff'), 
##D     type = 'cairo', 
##D     width = 5, 
##D     height = 5, 
##D     units = 'in', 
##D     res = 800, 
##D     compression = 'lzw'
##D     );
##D grid.draw(legend.grob2);
##D dev.off();
##D 
##D # create a legend where the title is underlined (see ?plotmath), add space between rows
##D legends2 <- list(
##D     legend = list(
##D         colours = c('orange', 'chartreuse4', 'darkorchid4'),
##D         labels = c('Group 1', 'Group 2', 'Group 3'),
##D         title = expression(underline('Legend #1'))
##D         ),
##D     legend = list(
##D         colours = c('firebrick3', 'lightgrey'),
##D         labels = c('A label', 'A longer label')
##D         )
##D     );
##D 
##D # create the new legend and use more complex border
##D legend.grob3 <- legend.grob(
##D     legends = legends2,
##D     border = list(col = 'blue', lwd = 2, lty = 3),
##D     border.padding = 1.5,
##D     between.row = 3
##D     );
##D tiff(
##D     file.path(tempdir(),'legend_grob3.tiff'), 
##D     type = 'cairo', 
##D     width = 5, 
##D     height = 5, 
##D     units = 'in', 
##D     res = 800, 
##D     compression = 'lzw'
##D     );
##D grid.draw(legend.grob3);
##D dev.off();
##D 
##D # Make a legend where the size of boxes is customized
##D legends3 <- list(
##D     legend = list(
##D         colours = c('orange', 'chartreuse4', 'darkorchid4'),
##D         labels = c('Group 1', 'Group 2', 'Group 3'),
##D         title = 'Legend #1',
##D         size = c(3,2,1)
##D         ),
##D     legend = list(
##D         colours = NULL,
##D         labels = c('+', '-'),
##D         border = 'transparent',
##D         title = 'Disease status',
##D         size = 0.5
##D         )
##D     );
##D legend.grob4 <- legend.grob(
##D     legends = legends3
##D     );
##D tiff(
##D     file.path(tempdir(),'legend_grob4.tiff'), 
##D     type = 'cairo', 
##D     width = 5, 
##D     height = 5, 
##D     units = 'in', 
##D     res = 800, 
##D     compression = 'lzw'
##D     );
##D grid.draw(legend.grob4);
##D dev.off();
## End(Not run)



