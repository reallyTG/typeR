library(NanoStringNorm)


### Name: other.normalization
### Title: other.normalization
### Aliases: other.normalization
### Keywords: NanoString Normalization mRNA miRNA

### ** Examples


# load the NanoString.mRNA dataset
data(NanoString);

# specify housekeeping genes in annotation 
NanoString.mRNA[NanoString.mRNA$Name %in% 
	c('Eef1a1','Gapdh','Hprt1','Ppia','Sdha'),'Code.Class'] <- 'Housekeeping';

# z-value transformation. scale each sample to have a mean 0 and sd
# by default all the other normalization methods are 'none'
# you cannot apply a log because there are negative values
# good for meta-analysis and cross platform comparison abstraction of effect size
NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA,
	OtherNorm = 'zscore',
	return.matrix.of.endogenous.probes = TRUE
	);


# inverse normal transformation. use quantiles to transform each sample to 
# the normal distribution
NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA,
	OtherNorm = 'rank.normal',
	return.matrix.of.endogenous.probes = TRUE
	);

# quantile normalization.  create an empirical distribution based on the 
# median gene counts at the same rank across sample.  then transform each
# sample to the empirical distribution.
NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA,
	OtherNorm = 'quantile',
	return.matrix.of.endogenous.probes = FALSE
	);

if(require(vsn)) { # only run if vsn installed
# vsn.  apply a variance stabilizing normalization.
# fit and predict the model using 'all' genes 
#	i.e. 'controls' and 'endogenous', this is the default
# note this is just a wrapper for the vsn package.
# you could even add strata for the controls vs the 
# 	endogenous to review systematic differences

NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA,
	OtherNorm = 'vsn',
	return.matrix.of.endogenous.probes = FALSE,
	genes.to.fit = 'all',
	genes.to.predict = 'all'
	);

# vsn. this time generate the parameters (fit the model) on the 'controls' and apply 
#	(predict) on the endogenous
# alternatively you may want to use the endogenous probes for both fitting and predicting.
NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA,
	OtherNorm = 'vsn',
	return.matrix.of.endogenous.probes = FALSE,
	genes.to.fit = 'controls',
	genes.to.predict = 'endogenous'
	);

# vsn. apply standard NanoString normalization strategies as an alternative to the vsn 
#	affine transformation.
# this effectively applies the glog2 variance stabilizing transformation to the 
#	adjusted counts
NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA,
	CodeCount = 'sum',
	Background = 'mean',
	SampleContent = 'top.geo.mean',
	OtherNorm = 'vsn',
	return.matrix.of.endogenous.probes = FALSE,
	genes.to.fit = 'endogenous',
	genes.to.predict = 'endogenous',
	calib = 'none'
	);
} # end vsn




