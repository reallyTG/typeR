library(BoutrosLab.plotting.general)


### Name: covariates.grob
### Title: Create one or more covariate bars
### Aliases: covariates.grob

### ** Examples


## Not run: 
##D # create temp data
##D set.seed(1234567890);
##D 
##D x <- outer(-5:5, -5:5, '*') + matrix(nrow = 11, ncol = 11, data = runif(11 * 11));
##D colnames(x) <- paste('col', 1:11, sep = '-');
##D rownames(x) <- paste('row', 1:11, sep = '-');
##D 
##D # set covariates
##D covariate.colours1 <- x[,1]
##D covariate.colours1[covariate.colours1 >= 0] <- default.colours(3)[1];
##D covariate.colours1[covariate.colours1 != default.colours(3)[1]] <- default.colours(3)[2];
##D 
##D covariate.colours2 <- x[,1]
##D covariate.colours2[covariate.colours2 >= 0] <- default.colours(3)[2];
##D covariate.colours2[covariate.colours2 != default.colours(3)[2]] <- default.colours(3)[3];
##D 
##D # create an object to draw the covariates from
##D covariates1 <- list(
##D     rect = list(
##D         col = 'black',
##D         fill = covariate.colours1,
##D         lwd = 1.5
##D         ),
##D     rect = list(
##D         col = 'black',
##D         fill = covariate.colours2,
##D         lwd = 1.5
##D         )
##D     );
##D 
##D # create a covariates grob using a simple incremental ordering and default behaviour
##D covariates.grob1 <- covariates.grob(
##D     covariates = covariates1,
##D     ord = c(1:ncol(x)),
##D     side = 'right'
##D     );
##D tiff(
##D     file.path(tempdir(),'covariates_grob1.tiff'), 
##D     type = 'cairo', 
##D     width = 6, 
##D     height = 6, 
##D     units = 'in', 
##D     res = 1000, 
##D     compression = 'lzw'
##D     );
##D grid.draw(covariates.grob1);
##D dev.off();
##D 
##D # create a dendrogram for x
##D cov.dendrogram <- BoutrosLab.plotting.general::create.dendrogram(
##D     x = x,
##D     clustering.method = 'average'
##D     );
##D 
##D covariates2 <-list(
##D     rect = list(
##D         col = 'black',
##D         fill = covariate.colours2,
##D         lwd = 1.5
##D         )
##D     );
##D 
##D # create a covariates grob using the dendrogram ordering and double the default size
##D covariates.grob2 <- covariates.grob(
##D     covariates = covariates2,
##D     ord = order.dendrogram(cov.dendrogram),
##D     side = 'top',
##D     size = 2
##D     );
##D tiff(
##D     file.path(tempdir(),'covariates_grob2.tiff'), 
##D     type = 'cairo', 
##D     width = 6, 
##D     height = 6, 
##D     units = 'in', 
##D     res = 1000, 
##D     compression = 'lzw'
##D     );
##D grid.draw(covariates.grob2);
##D dev.off();
##D 
##D # add a border of a different colour
##D covariates.grob3 <- covariates.grob(
##D     covariates = covariates1,
##D     ord = c(1:ncol(x)),
##D     side = 'right',
##D     grid.border = list(col = 'red', lwd = 1.5)
##D     );
##D tiff(
##D     file.path(tempdir(),'covariates_grob3.tiff'), 
##D     type = 'cairo', 
##D     width = 6, 
##D     height = 6, 
##D     units = 'in', 
##D     res = 1000, 
##D     compression = 'lzw'
##D     );
##D grid.draw(covariates.grob3);
##D dev.off();
##D 
##D # create covariates with transparent rectangle borders
##D covariates3 <- list(
##D     rect = list(
##D         col = 'transparent',
##D         fill = covariate.colours1,
##D         lwd = 1.5
##D         ),
##D     rect = list(
##D         col = 'transparent',
##D         fill = covariate.colours2,
##D         lwd = 1.5
##D         )
##D     );
##D 
##D # add column grid lines and a border with default gpar settings
##D covariates.grob4 <- covariates.grob(
##D     covariates = covariates3,
##D     ord = c(1:nrow(x)),
##D     side = 'top',
##D     grid.col = list(col = 'black', lty = 3),
##D     grid.border = list()
##D     );
##D tiff(
##D     file.path(tempdir(),'covariates_grob4.tiff'), 
##D     type = 'cairo', 
##D     width = 6, 
##D     height = 6, 
##D     units = 'in', 
##D     res = 1000, 
##D     compression = 'lzw'
##D     );
##D grid.draw(covariates.grob4);
##D dev.off();
##D 
##D # draw a subset of row/column lines
##D covariates.grob5 <- covariates.grob(
##D     covariates = covariates3,
##D     ord = order.dendrogram(cov.dendrogram),
##D     side = 'right',
##D     grid.row = list(lineend = 'butt', lwd = 2),
##D     row.lines = 6,
##D     reorder.grid.index = FALSE, # note: this is already set by default
##D     grid.col = list(lty = 2),
##D     col.lines = c(0,1)
##D     );
##D tiff(
##D     file.path(tempdir(),'covariates_grob5.tiff'), 
##D     type = 'cairo', 
##D     width = 6, 
##D     height = 6, 
##D     units = 'in', 
##D     res = 1000, 
##D     compression = 'lzw'
##D     );
##D grid.draw(covariates.grob5);
##D dev.off();
## End(Not run)



