library(asht)


### Name: meldtTest
### Title: Meld t Test
### Aliases: meldtTest
### Keywords: htest

### ** Examples

## Classical example: Student's sleep data
## Compare to bfTest
xValues<- sleep$extra[sleep$group==1]
yValues<- sleep$extra[sleep$group==2]


x<-list(estimate=mean(xValues),
    stderr=sd(xValues)/sqrt(length(xValues)),
    df=length(xValues)-1)
y<-list(estimate=mean(yValues),
    stderr=sd(yValues)/sqrt(length(yValues)),
    df=length(yValues)-1)
bfTest(xValues,yValues)
# by convention the meldtTest does mean(y)-mean(x)
meldtTest(x,y)
meldtTest(y,x)



