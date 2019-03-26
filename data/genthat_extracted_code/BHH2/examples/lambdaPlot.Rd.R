library(BHH2)


### Name: lambdaPlot
### Title: Lambda plot: traces the t and F statistics in Box-Cox
###   transformation of the response
### Aliases: lambdaPlot
### Keywords: design hplot

### ** Examples

library(BHH2)
# Lambda Plot tracing t values.
data(woolen.data)
woolen.lm <- lm(y~x1+x2+x3+I(x1^2)+I(x2^2)+I(x3^2)+
                    I(x1*x2)+I(x1*x3)+I(x2*x3)+I(x1*x2*x3),data=woolen.data)
lambdaPlot(woolen.lm,cex=.8,stat="t")

# Lambda Plot tracing F values.
woolen2.lm <- lm(y~x1+x2+x3,data=woolen.data)
lambdaPlot(woolen2.lm,lambda=seq(-1,1,length=41),stat="F",global=TRUE)

# Lambda Plot tracing F values.
data(poison.data)
poison.lm <- lm(y~treat*poison,data=poison.data)
lambdaPlot(poison.lm,lambda=seq(-3,1,by=.1),stat="F",global=FALSE)



