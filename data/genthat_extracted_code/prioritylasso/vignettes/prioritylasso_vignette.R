## ------------------------------------------------------------------------
library(prioritylasso)

## ------------------------------------------------------------------------
dim(pl_data)
colnames(pl_data)[1:30]
colnames(pl_data)[1025:1029]

## ------------------------------------------------------------------------
pl_out <- pl_data[,1029]
pl_pred <- pl_data[,1:1028]
blocks <- list(bp1=1:4, bp2=5:9, bp3=10:28, bp4=29:1028)

## ------------------------------------------------------------------------
set.seed(1234)
label <- sample(dim(pl_pred)[1],round(dim(pl_pred)[1]*(2/3)))
pl_train <- pl_pred[label,]
pl_val <- pl_pred[-label,]
pl_out_train <- pl_out[label]
pl_out_val <- pl_out[-label]

## ------------------------------------------------------------------------
set.seed(1234)
pl1 <- prioritylasso(X = pl_train, Y = pl_out_train, family = "binomial", type.measure = "auc", 
                     blocks = blocks, standardize = FALSE)

## ------------------------------------------------------------------------
set.seed(1234)
pl2 <- prioritylasso(X = pl_train, Y = pl_out_train, family = "binomial", type.measure = "auc", 
                     block1.penalization = TRUE, blocks = list(10:28, 1:4, 5:9,  29:1028),
                     standardize = FALSE)
pl2$nzero

## ------------------------------------------------------------------------
set.seed(1234)
pl3 <- prioritylasso(X = pl_train, Y = pl_out_train, family = "binomial", type.measure = "auc", 
                     block1.penalization = TRUE, blocks = list(10:28, 1:4, 5:9,  29:1028), 
                     max.coef = c(Inf, Inf, Inf, 10), standardize = FALSE)
pl3$nzero

## ------------------------------------------------------------------------
set.seed(1234)
pl4 <- prioritylasso(X = pl_train, Y = pl_out_train, family = "binomial", type.measure = "auc", 
                     block1.penalization = FALSE, blocks = list(1:4, 5:9, 10:28, 29:1028), 
                     max.coef = c(Inf, Inf, Inf, 10), standardize = FALSE)
pl4$block1unpen
pl4$lambda.ind

## ------------------------------------------------------------------------
set.seed(1234)
pl5_min <- prioritylasso(X = pl_train, Y = pl_out_train, family = "binomial", 
                         type.measure = "auc", block1.penalization = TRUE, 
                         blocks = list(1:4, 5:9, 10:28, 29:1028), 
                         lambda.type = "lambda.min", standardize = FALSE)

set.seed(1234)
pl5_1se <- prioritylasso(X = pl_train, Y = pl_out_train, family = "binomial", 
                         type.measure = "auc", block1.penalization = TRUE, 
                         blocks = list(1:4, 5:9, 10:28, 29:1028), 
                         lambda.type = "lambda.1se", standardize = FALSE)

pl5_min$nzero
pl5_1se$nzero

## ------------------------------------------------------------------------
pl1$lambda.ind
pl1$lambda.min

## ------------------------------------------------------------------------
pl1$min.cvm

## ------------------------------------------------------------------------
set.seed(1234)
cvm_pl1 <- cvm_prioritylasso(X = pl_train, Y = pl_out_train, family = "binomial", 
                             type.measure = "auc", standardize = FALSE, 
                             block1.penalization = FALSE, 
                             blocks.list = list(list(1:4, 5:9, 10:28, 29:1028), 
                                                list(1:4, 5:9, 29:1028, 10:28)), 
                             max.coef.list = list(c(Inf, Inf, Inf, 10), c(Inf, Inf, 10, Inf)))
cvm_pl1$best.blocks

## ------------------------------------------------------------------------
set.seed(1234)
pl_fit1 <- prioritylasso(X = pl_train, Y = pl_out_train, family = "binomial", 
                         type.measure = "auc", blocks = list(1:4, 5:9, 10:28, 29:1028), 
                         block1.penalization = FALSE, max.coef = c(Inf, Inf, Inf, 10), 
                         standardize = FALSE)

## ------------------------------------------------------------------------
coeff1 <- pl_fit1$coefficients
coeff1 <- coeff1[coeff1 != 0]
print(round(coeff1, 4))

## ---- message=FALSE------------------------------------------------------
library(pROC)

## ------------------------------------------------------------------------
pl1_score <- pl_train[ , names(coeff1)[-1], drop=F] %*% coeff1[-1]
pl1_roc <- roc(factor(pl_out_train), pl1_score[,1])
auc(pl1_roc)

## ------------------------------------------------------------------------
val1_score <- pl_val[ , names(coeff1)[-1], drop=F] %*% coeff1[-1]
val1_roc <- roc(factor(pl_out_val), c(val1_score))
auc(val1_roc)

## ------------------------------------------------------------------------
set.seed(1234)
pl_fit2 <- prioritylasso(X = pl_train, Y = pl_out_train, family = "binomial", 
                         type.measure = "auc", blocks = list(1:4, 10:28, 5:9, 29:1028), 
                         block1.penalization = FALSE, max.coef = c(Inf, Inf, Inf, 10), 
                         standardize = FALSE)

coeff2 <- pl_fit2$coefficients
coeff2 <- coeff2[coeff2 != 0]

val2_score <- pl_val[ , names(coeff2)[-1], drop=F] %*% coeff2[-1]
val2_roc <- roc(factor(pl_out_val), c(val2_score))
auc(val2_roc)

## ------------------------------------------------------------------------
roc.test(val1_roc, val2_roc, paired=TRUE)

## ---- fig.width=7.5, fig.height=6----------------------------------------
plot.roc(val1_roc, grid=0.1)
plot.roc(val2_roc, col="red", add=TRUE)
legend("bottomright", legend=c("prioritylasso Score 1", "prioritylasso Score 2"),
       col=c("black", "red"), lwd=2)

