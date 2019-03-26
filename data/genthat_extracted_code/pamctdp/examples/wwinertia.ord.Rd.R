library(pamctdp)


### Name: wwinertia.ord
### Title: Sorting of Rows and Columns by Intra Inertia in Double Intra
###   Correspondence Analysis
### Aliases: wwinertia.ord
### Keywords: multivariate

### ** Examples

# ICA of Ardeche using witwit.model
data(ardeche)
# change column names
names(ardeche$tab) <- paste(ardeche$sta.fac,ardeche$dat.fac,sep="") 
rownames(ardeche$tab) <- # change row names
paste(strtrim(rownames(ardeche$tab),1),substr(rownames(ardeche$tab),4,
	length(rownames(ardeche$tab))),sep="")
coa <- dudi.coa(ardeche$tab, scann = FALSE, nf = 4)
ica <- witwit.model(coa,ardeche$row.blocks,ardeche$col.blocks,scannf=FALSE,nf=4)
parica <- partial.wwm(ica)
wwinertia.ord(parica,ax=1)



