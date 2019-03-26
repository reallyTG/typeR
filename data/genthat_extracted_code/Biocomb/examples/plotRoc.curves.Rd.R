library(Biocomb)


### Name: plotRoc.curves
### Title: Plots the ROC curve for two-class problem
### Aliases: plotRoc.curves
### Keywords: feature selection classification AUC values ROC curve

### ** Examples

# example for dataset without missing values
data(leukemia72_2)

# class label must be factor
leukemia72_2[,ncol(leukemia72_2)]<-as.factor(leukemia72_2[,ncol(leukemia72_2)])

add.legend<-TRUE
include.auc<-TRUE

attrs.no=c(1,2)
xdata=leukemia72_2[,c(attrs.no,ncol(leukemia72_2))]
plotRoc.curves(dattable=xdata,add.legend=add.legend,include.auc=include.auc)



