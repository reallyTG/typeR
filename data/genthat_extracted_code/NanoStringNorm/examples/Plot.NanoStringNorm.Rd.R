library(NanoStringNorm)


### Name: Plot.NanoStringNorm
### Title: Plot.NanoStringNorm
### Aliases: Plot.NanoStringNorm
### Keywords: NanoString Normalization mRNA miRNA

### ** Examples
## Not run: 
##D 
##D # load data
##D data(NanoString);
##D 
##D # specifiy housekeeping genes in annotation 
##D NanoString.mRNA[NanoString.mRNA$Name %in% 
##D 	c('Eef1a1','Gapdh','Hprt1','Ppia','Sdha'),'Code.Class'] <- 'Housekeeping';
##D 
##D # setup the traits
##D sample.names <- names(NanoString.mRNA)[-c(1:3)];
##D strain1 <- rep(1, times = (ncol(NanoString.mRNA)-3));
##D strain1[grepl('HW',sample.names)] <- 2;
##D strain2 <- rep(1, times = (ncol(NanoString.mRNA)-3));
##D strain2[grepl('WW',sample.names)] <- 2;
##D strain3 <- rep(1, times = (ncol(NanoString.mRNA)-3));
##D strain3[grepl('LE',sample.names)] <- 2;
##D trait.strain <- data.frame(
##D 	row.names = sample.names,
##D 	strain1 = strain1,
##D 	strain2 = strain2,
##D 	strain3 = strain3
##D 	);
##D 
##D # normalize
##D NanoString.mRNA.norm <- NanoStringNorm(
##D 	x = NanoString.mRNA,
##D 	anno = NA,
##D 	CodeCount = 'geo.mean',
##D 	Background = 'mean.2sd',
##D 	SampleContent = 'housekeeping.geo.mean',
##D 	round.values = TRUE,
##D 	take.log = TRUE,
##D 	traits = trait.strain,
##D 	return.matrix.of.endogenous.probes = FALSE
##D 	);
##D 
##D # plot all the plots as PDF report
##D pdf('NanoStringNorm_Example_Plots_All.pdf')
##D Plot.NanoStringNorm(
##D 	x = NanoString.mRNA.norm,
##D 	label.best.guess = TRUE,
##D 	plot.type = 'all'
##D 	);
##D dev.off()
##D 
##D # publication quality tiff volcano plot
##D tiff('NanoStringNorm_Example_Plots_Volcano.tiff', units = 'in',  height = 6, 
##D 	width = 6, compression = 'lzw', res = 1200, pointsize = 10);
##D Plot.NanoStringNorm(
##D 	x = NanoString.mRNA.norm,
##D 	label.best.guess = TRUE,
##D 	plot.type = c('volcano'),
##D 	title = FALSE
##D 	);
##D dev.off()
##D 
##D # all plots as seperate files output for a presentation
##D png('NanoStringNorm_Example_Plots_%03d.png', units = 'in',  height = 6,
##D 	width = 6, res = 250, pointsize = 10);
##D Plot.NanoStringNorm(
##D 	x = NanoString.mRNA.norm,
##D 	label.best.guess = TRUE,
##D 	plot.type = c('cv','mean.sd','RNA.estimates','volcano','missing','norm.factors',
##D 		'positive.controls','batch.effects')
##D 	);
##D dev.off()
##D 
##D # user specified labelling with optimal resolution for most digital displays
##D png('NanoStringNorm_Example_Plots_Normalization_Factors.png', units = 'in', height = 6,
##D 	width = 6, res = 250, pointsize = 10);
##D Plot.NanoStringNorm(
##D 	x = NanoString.mRNA.norm,
##D 	label.best.guess = FALSE,
##D 	label.ids = list(genes = rownames(NanoString.mRNA.norm$gene.summary.stats.norm), 
##D 		samples = rownames(NanoString.mRNA.norm$sample.summary.stats)),
##D 	plot.type = c('norm.factors')
##D 	);
##D dev.off()
##D 
## End(Not run)


