## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(data.table)
library(xgboost)
library(xgb2sql)
df <- data.frame(ggplot2::diamonds)
head(df)

## ------------------------------------------------------------------------
out <- onehot2sql(df)
print(out$meta)
head(out$model.matrix)

## ------------------------------------------------------------------------
cat(out$sql)

## ------------------------------------------------------------------------
d2 <- data.table(ggplot2::diamonds)
# change column class
d2[, cut:=factor(cut, ordered=FALSE)]
d2[, clarity:=as.character(clarity)]
# create IDate column
d2[, tsdt:=as.IDate('2017-01-05')]
d2[1:3, tsdt:=tsdt-1]
# add NAs
d2[1, clarity:=NA]
d2[2, depth:=NA]
head(d2)
out2 <- onehot2sql(d2)
head(out2$model.matrix)

## ------------------------------------------------------------------------
newdata <- d2[1:5,]
# newdata has columns with new elements
newdata[5, clarity:='NEW']; newdata[1,tsdt:=as.IDate('2018-05-01')]
# newdata has a new column
newdata[, new_col:=1]
# newdata is lacking a column
newdata[, cut:=NULL]
head(newdata)
onehot2sql(newdata, meta=out2$meta)$model.matrix

## ------------------------------------------------------------------------
x <- out$model.matrix[,colnames(out$model.matrix)!='price']
y <- out$model.matrix[,colnames(out$model.matrix)=='price']
bst <- xgboost(data = x,
               label = y,
               max.depth = 2,
               eta = .3,
               nround = 2,
               objective = 'reg:linear')
booster2sql(bst, output_file_name='xgb.txt')

## ---- warning=FALSE, message=FALSE---------------------------------------
cat(readChar('xgb.txt', file.info('xgb.txt')$size))

## ------------------------------------------------------------------------
xgb.dump(bst)

## ------------------------------------------------------------------------
booster2sql(bst, output_file_name='onehot-xgb.txt', input_onehot_query=out$sql)

## ---- warning=FALSE, message=FALSE---------------------------------------
cat(readChar('onehot-xgb.txt', file.info('onehot-xgb.txt')$size))

