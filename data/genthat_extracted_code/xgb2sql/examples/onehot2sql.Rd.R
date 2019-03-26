library(xgb2sql)


### Name: onehot2sql
### Title: Prepare training data in R so that it is ready for XGBoost model
###   fitting. Meta information is stored so the exact transformation can
###   be applied to any new data. It also outputs SQL query performing the
###   exact one-hot encoding for in-database data preparation.
### Aliases: onehot2sql

### ** Examples

library(data.table)
### load test data
df = data.frame(ggplot2::diamonds)
head(df)

d1 = data.frame(ggplot2::diamonds)
d1[1,2] = NA  # NA on 1st row cut
d1[2,5] = NA  # NA on 2nd row depth
head(d1)

d2 = data.table(ggplot2::diamonds)
d2[, cut:=factor(cut, ordered=FALSE)]
d2[, clarity:=as.character(clarity)]
d2[, tsdt:=as.IDate('2017-01-05')]
d2[1:3, tsdt:=tsdt-1]
head(d2)

### out is obtained for training data
out <- onehot2sql(df)
out1 <- onehot2sql(d1)  # NA is kept in the output
out2 <- onehot2sql(d2)  # all non-numeric features will be treated as categorical

### perform same transformation for new data when meta is given
# test-1: new data has column class change
newdata = df[1:5,]
newdata$cut = as.character(newdata$cut)
onehot2sql(newdata, meta=out$meta)$model.matrix

# test-2: new data has NA
newdata = df[1:5,]
newdata[1,1]=NA; newdata[2,1]=NA; newdata[3,2]=NA; newdata[3,3]=NA; newdata[5,4]=NA
onehot2sql(newdata, meta=out$meta)$model.matrix

# test-3: newdata has column with new elements
newdata = d2[1:5,]
newdata[5,clarity:='NEW']; newdata[1,tsdt:=as.IDate('2017-05-01')]
onehot2sql(newdata, meta=out2$meta)$model.matrix

# test-4: newdata has new columns
newdata = d2[1:5,]
newdata[,new_col:=1]
onehot2sql(newdata, meta=out2$meta)$model.matrix

# test-5: newdata is lacking some columns
newdata = d2[1:5,]
newdata[,cut:=NULL]
onehot2sql(newdata, meta=out2$meta)$model.matrix



