library(Hmisc)


### Name: dotchart3
### Title: Enhanced Version of dotchart Function
### Aliases: dotchart3 dotchartp summaryD
### Keywords: hplot

### ** Examples

set.seed(135)
maj <- factor(c(rep('North',13),rep('South',13)))
g <- paste('Category',rep(letters[1:13],2))
n <- sample(1:15000, 26, replace=TRUE)
y1 <- runif(26)
y2 <- pmax(0, y1 - runif(26, 0, .1))
dotchart3(cbind(y1,y2), g, groups=maj, auxdata=n, auxtitle='n',
          xlab='Y', pch=c(1,17))
## Compare with dotchart function (no superpositioning or auxdata allowed):
## dotchart(y1, g, groups=maj, xlab='Y')

## Not run: 
##D dotchartp(cbind(y1, y2), g, groups=maj, auxdata=n, auxtitle='n',
##D           xlab='Y', gdata=cbind(c(0,.1), c(.23,.44)), auxgdata=c(-1,-2),
##D           symbol=c('circle', 'line-ns-open'))
## End(Not run)

## Put options(grType='plotly') to have the following use dotchartp
## (rlegend will not apply)
## Add argument auxwhere='hover' to summaryD or dotchartp to put
## aux info in hover text instead of right margin
summaryD(y1 ~ maj + g, xlab='Mean')
summaryD(y1 ~ maj + g, groupsummary=FALSE)
summaryD(y1 ~ g, fmtvals=function(x) sprintf('%4.2f', x))
Y <- cbind(y1, y2)   # summaryD cannot handle cbind(...) ~ ...
summaryD(Y  ~ maj + g, fun=function(y) y[1,], symbol=c(1,17))
rlegend(.1, 26, c('y1','y2'), pch=c(1,17))

summaryD(y1 ~ maj, fun=function(y) c(Mean=mean(y), n=length(y)),
         auxvar='n', auxtitle='N')



