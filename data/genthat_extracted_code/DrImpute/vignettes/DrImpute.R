## ----knitr_options, echo=FALSE, results=FALSE----------------------------
library(knitr)
opts_chunk$set(fig.width = 12)

## ----loading, include=FALSE----------------------------------------------
library(DrImpute)

## ----loading2------------------------------------------------------------

data(exdata)
exdata <- preprocessSC(exdata)

## ----loading3------------------------------------------------------------
sf <- apply(exdata, 2, mean)
npX <- t(t(exdata) / sf ) 
lnpX <- log(npX+1)

## ----loading4------------------------------------------------------------
lnpX_imp <- DrImpute(lnpX)

## ---- include=FALSE------------------------------------------------------
zero_p <- sum(lnpX == 0)/(dim(lnpX)[1]*dim(lnpX)[2])
zero_p_imp <- sum(lnpX_imp == 0)/(dim(lnpX)[1]*dim(lnpX)[2])

## ----viz1, echo=FALSE, fig.width=7, fig.height=3.5-----------------------
par(mfrow = c(1,2))

lXc <- scale(t(lnpX), center= TRUE, scale = FALSE)
lXc_imp <- scale(t(lnpX_imp), center= TRUE, scale = FALSE)

library(irlba)
#svd.lXc <- svd(t(lXc))
svd.lXc <- irlba(lXc, nv = 2)
svd.lXc.imp <- irlba(lXc_imp, nv = 2)

PC <- svd.lXc$u %*% diag(svd.lXc$d)
PC.imp <- svd.lXc.imp$u %*% diag(svd.lXc.imp$d)

plot(PC, bg= c("red", "blue","black", "purple")[factor(colnames(exdata))], type = "p", pch = 21, col = "black", main = "Without imputation", xlab = "PC1", ylab="PC2")
plot(PC.imp, bg= c("red", "blue","black", "purple")[factor(colnames(exdata))], type = "p", pch=21, col="black", main = "With DrImpute", xlab = "PC1", ylab="PC2")

add_legend <- function(...) {
  opar <- par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0),
    mar=c(0, 0, 0, 0), new=TRUE)
  on.exit(par(opar))
  plot(0, 0, type='n', bty='n', xaxt='n', yaxt='n')
  legend(...)
}

add_legend("bottomright", legend=levels(factor(colnames(exdata))), pch=19, col = c("red","blue", "black", "purple"), cex=1, horiz = TRUE)


