library(pamctdp)


### Name: partial.wwm
### Title: Coordinates and Aids to Interpretation of Superimposed
###   Representation of Double Intra Correspondence Analysis
### Aliases: partial.wwm print.parwwm wwm.util.addfactor<-
### Keywords: multivariate

### ** Examples

data(ardeche)
# change column names
names(ardeche$tab) <- paste(ardeche$sta.fac,ardeche$dat.fac,sep="") 
rownames(ardeche$tab) <- # change row names
paste(strtrim(rownames(ardeche$tab),1),substr(rownames(ardeche$tab),4,
	length(rownames(ardeche$tab))),sep="")
coa <- dudi.coa(ardeche$tab, scann = FALSE, nf = 4)
ww <- witwit.model(coa, ardeche$row.blocks, ardeche$col.blocks, scannf = FALSE)
parica <- partial.wwm(ww)
parica



