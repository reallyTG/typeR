library(MAMSE)


### Name: roc
### Title: Receiver Operating Characteristic (ROC) Curves
### Aliases: roc plot.roc
### Keywords: nonparametric ROC diagnostic

### ** Examples

data(Progesterone)
healthy=lapply(Progesterone,function(x){x$viable})
diseased=lapply(Progesterone,function(x){sort(c(x$ecto,x$abort))})

par(mfrow=c(2,2))

plot(roc(healthy[[1]],diseased[[1]],AUC=TRUE))
title("Empirical ROC curve based on Ledger (1994)")
plot(roc(healthy[[1]],diseased[[1]],AUC=TRUE,method="lognormal"))
title("Parametric ROC curve based on Ledger (1994)")

plot(roc(healthy,diseased,AUC=TRUE))
title("MAMSE-weighted empirical ROC curve")
plot(roc(healthy,diseased,AUC=TRUE,method="lognormal"))
title("MAMSE-weighted parametric ROC curve")




