library(npbr)


### Name: dea_est
### Title: DEA, FDH and linearized FDH estimators.
### Aliases: dea_est
### Keywords: nonparametric optimize

### ** Examples

data("green")
plot(OUTPUT~COST, data=green)
x <- seq(min(green$COST), max(green$COST), length.out=1001)
# We compute and represent the DEA, FDH and LFDH estimates
lines(x, dea_est(green$COST, green$OUTPUT, x, type="dea"),
 lty=4, lwd=4, col="cyan")  
lines(x, dea_est(green$COST, green$OUTPUT, x, type="fdh"),
 lty=1, lwd=4, col="green")
lines(x, dea_est(green$COST, green$OUTPUT, x, type="lfdh"), 
 lty=2, lwd=4, col="magenta")   
legend("topleft",legend=c("dea","fdh","lfdh"), 
 col=c("cyan","green","magenta"), lty=c(4,1,2), lwd=4)



