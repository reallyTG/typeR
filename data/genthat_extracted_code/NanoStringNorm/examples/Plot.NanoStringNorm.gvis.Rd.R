library(NanoStringNorm)


### Name: Plot.NanoStringNorm.gvis
### Title: Plot.NanoStringNorm.gvis
### Aliases: Plot.NanoStringNorm.gvis
### Keywords: NanoString Normalization mRNA miRNA

### ** Examples

 
 # load data
 data(NanoString);
 
 # specify housekeeping genes in annotation 
 NanoString.mRNA[NanoString.mRNA$Name %in%
         c('Eef1a1','Gapdh','Hprt1','Ppia','Sdha'),'Code.Class'] <- 'Housekeeping';
 
 # setup the traits
 sample.names <- names(NanoString.mRNA)[-c(1:3)];
 strain1 <- rep(1, times = (ncol(NanoString.mRNA)-3));
 strain1[grepl('HW',sample.names)] <- 2;
 strain2 <- rep(1, times = (ncol(NanoString.mRNA)-3));
 strain2[grepl('WW',sample.names)] <- 2;
 strain3 <- rep(1, times = (ncol(NanoString.mRNA)-3));
 strain3[grepl('LE',sample.names)] <- 2;
 trait.strain <- data.frame(
         row.names = sample.names,
         strain1 = strain1,
         strain2 = strain2,
         strain3 = strain3
         );
 
 # normalize
 NanoString.mRNA.norm <- NanoStringNorm(
         x = NanoString.mRNA,
         anno = NA,
         CodeCount = 'geo.mean',
         Background = 'mean.2sd',
         SampleContent = 'housekeeping.geo.mean',
         round.values = TRUE,
         take.log = TRUE,
         traits = trait.strain,
         return.matrix.of.endogenous.probes = FALSE
         );
 
 # plot the sample summaries to your browser
 if (requireNamespace("googleVis")) {
 Plot.NanoStringNorm.gvis(
         x = NanoString.mRNA.norm,
         plot.type = c('gene.norm', 'sample'),
         save.plot = FALSE
         );
 
 # plot the gene summaries to a directory for distribution and later viewing
 Plot.NanoStringNorm.gvis(
        x = NanoString.mRNA.norm,
         plot.type = c('gene.norm', 'sample'),
         save.plot = TRUE,
         path.to.mongoose = 'none',
         output.directory = "NanoStringNorm_Interactive_Plot"
         );
 }
 


