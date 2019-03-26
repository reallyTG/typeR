library(NanoStringNorm)


### Name: NanoStringNorm
### Title: Methods for preprocessing NanoString nCounter data
### Aliases: NanoStringNorm
### Keywords: NanoString Normalization mRNA miRNA

### ** Examples


### 1 Normalize mRNA and output a matrix of normalized counts #################

# load the NanoString.mRNA dataset
data(NanoString);

# alternatively you can import the dataset
# path.to.xls.file <- system.file("extdata", "RCC_files", "RCCCollector1_rat_tcdd.xls", 
# 	package = "NanoStringNorm");
# NanoString.mRNA <- read.xls.RCC(x = path.to.xls.file, sheet = 1);

# specifiy housekeeping genes in annotation 
NanoString.mRNA[NanoString.mRNA$Name %in% 
	c('Eef1a1','Gapdh','Hprt1','Ppia','Sdha'),'Code.Class'] <- 'Housekeeping';

# normalize
NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA,
	anno = NA,
	CodeCount = 'geo.mean',
	Background = 'mean',
	SampleContent = 'housekeeping.geo.mean',
	round.values = TRUE,
	take.log = TRUE,
	return.matrix.of.endogenous.probes = TRUE
	);

### 2 include a trait for differential expression and batch effect evaluation  #
### 	A list of diagnostic objects is output.                                #

# Define a traits based on strain
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

# Split the input into separate annotation and count input  ###################

NanoString.mRNA.anno <- NanoString.mRNA[,c(1:3)];
NanoString.mRNA.data <- NanoString.mRNA[,-c(1:3)];

# Normalize
NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA.data,
	anno = NanoString.mRNA.anno,
	CodeCount = 'sum',
	Background = 'mean.2sd',
	SampleContent = 'top.geo.mean',
	round.values = TRUE,
	take.log = TRUE,
	traits = trait.strain,
	return.matrix.of.endogenous.probes = FALSE
	);

### 3 plot results ############################################################

# Plot all the plots as PDF report.  See help on Plot.NanoStringNorm for examples
pdf('NanoStringNorm_Example_Plots_All.pdf');
Plot.NanoStringNorm(
	x = NanoString.mRNA.norm,
	label.best.guess = TRUE,
	plot.type = 'all'
	);
dev.off();




