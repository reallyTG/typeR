library(SeleMix)


### Name: sel.edit
### Title: Influential Error Detection
### Aliases: sel.edit

### ** Examples

# Example 1
# Parameter estimation with one contaminated variable and one covariate
    data(ex1.data)
    ml.par <- ml.est(y=ex1.data[,"Y1"], x=ex1.data[,"X1"])
# Detection of influential errors    
    sel <- sel.edit(y=ex1.data[,"Y1"], ypred=ml.par$ypred)
    head(sel)
    sum(sel[,"sel"])
# orders results for decreasing importance of score     
    sel.ord <- sel[order(sel[,"rank"]),  ] 
# adds columns to data
    ex1.data <- cbind(ex1.data, tau=ml.par$tau, outlier=ml.par$outlier,
                      sel[,c("rank", "sel")])
# plot of data with outliers and influential errors 
    sel.pairs(ex1.data[,c("X1","Y1")],outl=ml.par$outlier, sel=sel[,"sel"])
# Example 2
    data(ex2.data)
    par.joint <- ml.est(y=ex2.data)
    sel <- sel.edit(y=ex2.data, ypred=par.joint$ypred)	
    sel.pairs(ex2.data,outl=par.joint$outlier, sel=sel[,"sel"])



