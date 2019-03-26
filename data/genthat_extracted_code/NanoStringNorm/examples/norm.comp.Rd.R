library(NanoStringNorm)


### Name: norm.comp
### Title: norm.comp
### Aliases: norm.comp
### Keywords: NanoString Normalization mRNA miRNA

### ** Examples
## Not run: 
##D 
##D # load the NanoString.mRNA dataset
##D data(NanoString);
##D 
##D 
##D # specifiy housekeeping genes in annotation
##D NanoString.mRNA[NanoString.mRNA$Name %in% c('Eef1a1','Gapdh','Hprt1','Ppia','Sdha'),
##D 	'Code.Class'] <- 'Housekeeping';
##D 
##D NanoString.mRNA <- NanoString.mRNA[1:50,];
##D 
##D 
##D # strain x experimental condition i.e. replicate.
##D # this is only a small subset of the original data used for the plot
##D biological.replicates <- c("HW_1.5_0","HW_1.5_0","HW_1.5_0","HW_1.5_100","HW_1.5_100",
##D "HW_1.5_100","HW_6_100","HW_6_100","HW_3_100","HW_3_100","HW_3_100","HW_3_100","LE_19_0",
##D "LE_19_0","LE_19_0","LE_96_0","LE_96_0","LE_96_0","HW_10_100","HW_10_100","HW_10_100",
##D "HW_10_100","HW_6_100","HW_6_100","HW_96_0");
##D 
##D if (requireNamespace("lme4")) {
##D 
##D norm.comp.results <- norm.comp(
##D x = NanoString.mRNA,
##D replicates = biological.replicates,
##D CodeCount.methods = 'none',
##D Background.methods = 'none',
##D SampleContent.methods = c('none','housekeeping.sum', 'housekeeping.geo.mean',
##D 	'top.mean', 'top.geo.mean'),
##D OtherNorm.methods = 'none',
##D verbose = FALSE
##D );
##D 
##D }
##D 
## End(Not run)


