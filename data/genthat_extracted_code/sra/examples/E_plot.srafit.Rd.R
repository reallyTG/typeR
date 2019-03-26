library(sra)


### Name: 5. plot.srafit
### Title: Plotting "srafit" objects
### Aliases: plot.srafit sraPlotMean sraPlotMeanResid sraPlotVar
###   sraPlotVarResid sraPlotlegend sraFormatlegend
### Keywords: hplot models

### ** Examples

########### Generating a dummy dataset ################

m <- c(12,11,12,14,18,17,19,22,20,19)
v <- c(53,47,97,155,150,102,65,144,179,126)
s <- c(15,14,14,17,21,20,22,25,24,NA)
n <- c(100,80,120,60,100,90,110,80,60,100)

########## Making a sra data set #######################
data <- sraData(phen.mean=m, phen.var=v, phen.sel=s, N=n)

cstvar <- sraCstvar(data)


plot(cstvar)
plot(cstvar, xlim=c(3,9))
plot(cstvar, var=TRUE, ylab="This is a custom Y axis label")
plot(cstvar, resid=TRUE, legend=FALSE, main="Constant variance model fit")



