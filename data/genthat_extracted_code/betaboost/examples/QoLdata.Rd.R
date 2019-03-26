library(betaboost)


### Name: QoLdata
### Title: Examplary Quality of Life data
### Aliases: QoLdata

### ** Examples

#
# was constructed from dataqol2
data(dataqol2)
data(QoLdata)
## take one time-point
dataqol <- dataqol2[dataqol2$time ==0,]
## remove missings
dataqol <- dataqol[complete.cases(dataqol[,c("QoL", "arm", "pain")]),]
## rescale outcome to [0,1]
dataqol$QoL <- dataqol$QoL/100

identical(dataqol, QoLdata )





