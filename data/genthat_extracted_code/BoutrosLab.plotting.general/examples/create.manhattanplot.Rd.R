library(BoutrosLab.plotting.general)


### Name: create.manhattanplot
### Title: Make a Manhattan plot
### Aliases: create.manhattanplot
### Keywords: hplot

### ** Examples


## Not run: 
##D set.seed(12345);
##D simple.data <- data.frame(
##D     x = runif(20000, 0, 1),
##D     y = 1:20000
##D     );
##D 
##D create.manhattanplot(
##D     filename = paste0(tempdir(),'/Manhattan_Simple.tiff'),
##D     formula = -log10(x) ~ y,
##D     data = simple.data,
##D     main = 'Simple',
##D     description = 'Manhattan plot created using BoutrosLab.plotting.general'
##D     );
##D 
##D # set up chromosome covariate colours to use for chr covariate, below
##D chr.colours <- force.colour.scheme(microarray$Chr, scheme = 'chromosome');
##D 
##D # make chr covariate and chr labels 
##D chr.n.genes       <- vector();
##D chr.tck           <- vector();
##D chr.pos.genes     <- vector();
##D chr.break         <- vector();
##D chr.break[1]      <- 0;
##D # get a list of chromosomes to loop
##D chr <- unique(microarray$Chr);
##D 
##D # loop over each chromosome
##D for ( i in 1:length(chr) ) {
##D 
##D     # get the number of genes that belong to one chromosome
##D     n <- sum(microarray$Chr == chr[i]);
##D 
##D     # calculate where the labels go
##D     chr.n.genes[i]   <- n;
##D     chr.break[i+1] <- n + chr.break[i];
##D     chr.pos.genes[i] <- floor(chr.n.genes[i]/2);
##D     chr.tck[i]       <- chr.pos.genes[i] + which(microarray$Chr == chr[i])[1];
##D     }
##D 
##D # add an indicator function for the data-frame
##D microarray$ind <- 1:nrow(microarray);
##D 
##D # Minimal input
##D create.manhattanplot(
##D     filename = paste0(tempdir(),'/Manhattan_Minimal_Input.tiff'),
##D     formula = -log10(pval) ~ ind,
##D     data = microarray,
##D     main = 'Minimal input',
##D     description = 'Manhattan plot created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Custom Axes
##D create.manhattanplot(
##D     filename = paste0(tempdir(),'/Manhattan_Custom_Axes.tiff'),
##D     formula = -log10(pval) ~ ind,
##D     data = microarray,
##D     main = 'Custom axes',
##D     xlab.label = expression('Chromosomes'),
##D     ylab.label = expression('P'['adjusted']),
##D     xat = chr.tck,
##D     xaxis.lab = c(1:22, 'X', 'Y'),
##D     xaxis.tck = 0,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     yat = seq(0,5,1),
##D     yaxis.lab = c(
##D         1,
##D         expression(10^-1),
##D         expression(10^-2),
##D         expression(10^-3),
##D         expression(10^-4)
##D         ),
##D     description = 'Manhattan plot created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Colour scheme
##D create.manhattanplot(
##D     filename = paste0(tempdir(),'/Manhattan_Colour_Scheme.tiff'),
##D     formula = -log10(pval) ~ ind,
##D     data = microarray,
##D     main = 'Colour scheme',
##D     xlab.label = expression('Chromosomes'),
##D     ylab.label = expression('P'['adjusted']),
##D     xat = chr.tck,
##D     xaxis.lab = c(1:22, 'X', 'Y'),
##D     xaxis.tck = 0,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     yat = seq(0,5,1),
##D     yaxis.lab = c(
##D         1,
##D         expression(10^-1),
##D         expression(10^-2),
##D         expression(10^-3),
##D         expression(10^-4)
##D         ),
##D     col = chr.colours,
##D     description = 'Manhattan plot created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Plotting Character
##D create.manhattanplot(
##D     filename = paste0(tempdir(),'/Manhattan_Plotting_Character.tiff'),
##D     formula = -log10(pval) ~ ind,
##D     data = microarray,
##D     main = 'Plotting character',
##D     xlab.label = expression('Chromosomes'),
##D     ylab.label = expression('P'['adjusted']),
##D     xat = chr.tck,
##D     xaxis.lab = c(1:22, 'X', 'Y'),
##D     xaxis.tck = 0,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     yat = seq(0,5,1),
##D     yaxis.lab = c(
##D         1,
##D         expression(10^-1),
##D         expression(10^-2),
##D         expression(10^-3),
##D         expression(10^-4)
##D         ),
##D     col = chr.colours,
##D     # Change plotting character and size of plotting character
##D     pch = 18,
##D     cex = 0.75,
##D     description = 'Manhattan plot created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Line
##D create.manhattanplot(
##D     filename = paste0(tempdir(),'/Manhattan_Added_Line.tiff'),
##D     formula = -log10(pval) ~ ind,
##D     data = microarray,
##D     main = 'Line',
##D     xlab.label = expression('Chromosomes'),
##D     ylab.label = expression('P'['adjusted']),
##D     xat = chr.tck,
##D     xaxis.lab = c(1:22, 'X', 'Y'),
##D     xaxis.tck = 0,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     yat = seq(0,5,1),
##D     yaxis.lab = c(
##D         1,
##D         expression(10^-1),
##D         expression(10^-2),
##D         expression(10^-3),
##D         expression(10^-4)
##D         ),
##D     col = chr.colours,
##D     pch = 18,
##D     cex = 0.75,
##D     # draw horizontal line
##D     abline.h = 2,
##D     abline.lty = 2,
##D     abline.lwd = 1,
##D     abline.col = 'black',
##D     description = 'Manhattan plot created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Background shading
##D create.manhattanplot(
##D     filename = paste0(tempdir(),'/Manhattan_BG.tiff'),
##D     formula = -log10(pval) ~ ind,
##D     data = microarray,
##D     main = 'Bg rectangles',
##D     xlab.label = expression('Chromosomes'),
##D     ylab.label = expression('P'['adjusted']),
##D     xat = chr.tck,
##D     xaxis.lab = c(1:22, 'X', 'Y'),
##D     xaxis.tck = 0,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     yat = seq(0,5,1),
##D     yaxis.lab = c(
##D         1,
##D         expression(10^-1),
##D         expression(10^-2),
##D         expression(10^-3),
##D         expression(10^-4)
##D         ),
##D     col = chr.colours,
##D     pch = 18,
##D     cex = 0.75,
##D     abline.h = 2,
##D     abline.lty = 2,
##D     abline.lwd = 1,
##D     abline.col = 'black',
##D     # Adding rectangles
##D     add.rectangle = TRUE,
##D     xleft.rectangle = chr.break[seq(1, length(chr.break) - 1, 2)],
##D     ybottom.rectangle = 0,
##D     xright.rectangle = chr.break[seq(2, length(chr.break) - 1, 2)],
##D     ytop.rectangle = 4.5,
##D     col.rectangle = 'grey',
##D     alpha.rectangle = 0.5,
##D     description = 'Manhattan plot created using BoutrosLab.plotting.general'
##D     );
##D 
##D # Nature style
##D create.manhattanplot(
##D     filename = paste0(tempdir(),'/Manhattan_Nature_style.tiff'),
##D     formula = -log10(pval) ~ ind,
##D     data = microarray,
##D     main = 'Nature style',
##D     xat = chr.tck,
##D     xaxis.lab = c(1:22, 'X', 'Y'),
##D     xaxis.tck = 0,
##D     xaxis.cex = 1,
##D     yaxis.cex = 1,
##D     yat = seq(0,5,1),
##D     yaxis.lab = c(
##D         1,
##D         expression(10^-1),
##D         expression(10^-2),
##D         expression(10^-3),
##D         expression(10^-4)
##D         ),
##D     col = chr.colours,
##D     pch = 18,
##D     cex = 0.75,
##D     abline.h = 2,
##D     abline.lty = 2,
##D     abline.lwd = 1,
##D     abline.col = 'black',
##D     # Adding rectangles
##D     add.rectangle = TRUE,
##D     xleft.rectangle = chr.break[seq(1, length(chr.break) - 1, 2)],
##D     ybottom.rectangle = 0,
##D     xright.rectangle = chr.break[seq(2, length(chr.break) - 1, 2)],
##D     ytop.rectangle = 4.5,
##D     col.rectangle = 'grey',
##D     alpha.rectangle = 0.5,
##D 
##D     # set style to Nature 
##D     style = 'Nature',
##D     
##D     # demonstrating how to italicize character variables
##D     ylab.label = expression(paste('italicized ', italic('a'))),
##D   
##D     # demonstrating how to create en-dashes
##D     xlab.label = expression(paste('en dashs: 1','\u2013', '10'^'\u2013', ''^3)),
##D 
##D     description = 'Manhattan plot created using BoutrosLab.plotting.general'
##D     );
## End(Not run)



