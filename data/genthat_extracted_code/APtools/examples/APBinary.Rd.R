library(APtools)


### Name: APBinary
### Title: Estimating the AP and the AUC for Binary Outcome Data.
### Aliases: APBinary

### ** Examples

status=c(rep(1,10),rep(0,1),rep(1,18),rep(0,11),rep(1,25),
	rep(0,44),rep(1,85),rep(0,176))
marker=c(rep(7,11),rep(6,29),rep(5,69),rep(4,261))
cut.values=sort(unique(marker)[-1])
out1 <- APBinary(status,marker,cut.values)
out1
out2 <- APBinary(status,marker,method="perturbation",
	alpha=0.90,B=1500)
out2



