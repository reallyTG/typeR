library(prc)


### Name: prc
### Title: Four Parameter Paired Response Curve
### Aliases: prc prcstruct coef.prc predict.prc plot.prc print.prc
###   lines.prc four_pl_prc s.dot.f prcsp compute.A mixlik mixlik.prc
###   quadratic.eiv coef.quad lines.quad plot.quad print.quad quad.f
###   quadratic.eiv.sp

### ** Examples


# estimation
fit=prc (mtct.eg$V3_BioV3B_2500, 2500, mtct.eg$V3_BioV3B_500, 500, verbose=TRUE) 
plot(fit)

# prediction
logfi.1000 = predict(fit, new.dilution=1000)
points(exp(fit$rvar), exp(logfi.1000), col=2, cex=.5)

theta=coef(fit)
four_pl_prc(theta["c"], theta["d"], theta["b"], theta["f"], log(500), k=5)




