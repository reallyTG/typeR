library(BoutrosLab.plotting.general)


### Name: get.correlation.p.and.corr
### Title: Calculate a correlation and its statistical significance
### Aliases: get.correlation.p.and.corr
### Keywords: htest

### ** Examples

get.correlation.p.and.corr(
	x = runif(100),
	y = runif(100),
	method = 'pearson'
	);

get.correlation.p.and.corr(
	x = sample(1:10, 100, replace = TRUE),
	y = runif(100),
	method = 'spearman'
	);



