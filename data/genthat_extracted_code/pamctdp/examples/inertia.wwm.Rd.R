library(pamctdp)


### Name: inertia.wwm
### Title: Additional aids to interpretation of Double Intra Correspondence
###   Analysis
### Aliases: inertia.wwm print.wwinertia
### Keywords: multivariate

### ** Examples

data(ardeche)
# change column names
names(ardeche$tab) <- paste(ardeche$sta.fac,ardeche$dat.fac,sep="") 
rownames(ardeche$tab) <- # change row names
paste(strtrim(rownames(ardeche$tab),1),substr(rownames(ardeche$tab),4,
	length(rownames(ardeche$tab))),sep="")
coa1 <- dudi.coa(ardeche$tab, scann = FALSE, nf = 4)
ww <- witwit.model(coa1, ardeche$row.blocks, ardeche$col.blocks, scann = FALSE)
aids <- inertia(ww) 
aids$col
aids$row



