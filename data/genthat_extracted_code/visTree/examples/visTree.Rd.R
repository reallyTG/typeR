library(visTree)


### Name: visTree
### Title: Visualization of subgroups for decision trees
### Aliases: visTree
### Keywords: decision pathway tree visualization

### ** Examples

data(blsdata)
newblsdata<-blsdata[,c(7,21, 22,23, 24, 25, 26)]
## Continuous response
ptree1<-partykit::ctree(kcal24h0~., data = newblsdata)
visTree(ptree1, text.axis = 1.3, text.label = 1.2, text.bar = 1.2, alpha = 0.5)

## Repeated covariates in the splits of the decision tree
ptree2<-partykit::ctree(kcal24h0~skcal+rrvfood+resteating+age, data = blsdata)
visTree(ptree2, text.axis = 1.3, text.label = 1.2, text.bar = 1.2, alpha = 0.5)

## Categorical response
blsdataedit<-blsdata[,-7]
blsdataedit$bin<-0 
blsdataedit$bin<-cut(blsdata$kcal24h0, unique(quantile(blsdata$kcal24h0)), 
include.lowest = TRUE, dig.lab = 4)
names(blsdataedit)[26]<-"kcal24h0"
ptree3<-partykit::ctree(kcal24h0~hunger+rrvfood+resteating+liking, data = blsdataedit)
visTree(ptree3, interval = TRUE,  color.type = 1, alpha = 0.6, 
text.percentile = 1.2, text.bar = 1.8)

## Other decision trees (e.g., rpart) 
ptree4<-rpart::rpart(kcal24h0~wanting+liking+rrvfood, data = newblsdata, 
control = rpart::rpart.control(cp = 0.029))
visTree(ptree4, text.bar = 1.8, text.label = 1.4, text.round = 1, 
density.line = TRUE, text.percentile = 1.3)

## Change the color scheme and transparency of the horizontal bars
ptree1<-partykit::ctree(kcal24h0~., data = newblsdata)
visTree(ptree1, text.axis = 1.3, text.label = 1.2, text.bar = 1.2, alpha = 0.65, 
color.type = 3)

## Remove the axes corresponding to the percentiles and the response values.
ptree1<-partykit::ctree(kcal24h0~., data = newblsdata)
visTree(ptree1, text.axis = 1.3, text.label = 1.2, text.bar = 1.2, alpha = 0.65, 
color.type = 3, add.p.axis = FALSE, add.h.axis = FALSE) 

# Remove the density line over the histograms 
ptree1<-partykit::ctree(kcal24h0~., data = newblsdata)
visTree(ptree1, text.axis = 1.3, text.label = 1.2, text.bar = 1.2, alpha = 0.65, 
color.type = 3, density.line = FALSE) 



