library(agricolae)


### Name: tapply.stat
### Title: Statistics of data grouped by factors
### Aliases: tapply.stat
### Keywords: univar

### ** Examples

library(agricolae)
# case of 1 single factor
data(sweetpotato)
tapply.stat(sweetpotato[,2],sweetpotato[,1],mean)
with(sweetpotato,tapply.stat(yield,virus,sd))
with(sweetpotato,tapply.stat(yield,virus,function(x) max(x)-min(x)))
with(sweetpotato,tapply.stat(yield,virus,
function(x) quantile(x,0.75,6)-quantile(x,0.25,6)))
# other case
data(cotton)
with(cotton,tapply.stat(yield,cotton[,c(1,3,4)],mean))
with(cotton,tapply.stat(yield,cotton[,c(1,4)],max))
# Height of pijuayo
data(growth)
with(growth,tapply.stat(height, growth[,2:1], function(x) mean(x,na.rm=TRUE)))



