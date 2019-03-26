library(VIF)


### Name: vif
### Title: Fitting Linear Models using VIF-Regression
### Aliases: vif
### Keywords: regression

### ** Examples


	data(syn);
	vif.sel <- vif(syn$y, syn$x, trace = FALSE);
	vif.sel$select;
	syn$true;
	
	data(housingexp);
	colnames(housingexp$x);
	vif.sel <- vif(housingexp$y, housingexp$x, w0 = 0.0005, dw = 0.005, subsize = 300, trace = FALSE);




