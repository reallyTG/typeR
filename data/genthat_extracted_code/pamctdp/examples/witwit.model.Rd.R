library(pamctdp)


### Name: witwit.model
### Title: Within Correspondence Analysis using divers Models and Weights
### Aliases: witwit.model summary.wwmodel print.wwmodel
### Keywords: multivariate

### ** Examples

data(ardeche)
# change column names
names(ardeche$tab) <- paste(ardeche$sta.fac,ardeche$dat.fac,sep="") 
rownames(ardeche$tab) <- # change row names
paste(strtrim(rownames(ardeche$tab),1),substr(rownames(ardeche$tab),4,
	length(rownames(ardeche$tab))),sep="")
coa1 <- dudi.coa(ardeche$tab, scannf = FALSE, nf = 4)
ww <- witwit.model(coa1, ardeche$row.blocks, ardeche$col.blocks, scann = FALSE)
ww
plot(ww)
summary(ww)



