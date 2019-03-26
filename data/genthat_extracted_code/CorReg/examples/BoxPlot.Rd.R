library(CorReg)


### Name: BoxPlot
### Title: Boxplot with confidence interval and ANOVA on the plot.
### Aliases: BoxPlot

### ** Examples

    ## Not run: 
##D require(CorReg)
##D repart=c(20,40,40)
##D X=data.frame(num=c(rnorm(repart[1],10,1),rnorm(repart[2],11,1),rnorm(repart[3],10,1)),
##D grp=c(rep("A",times=repart[1]),rep("B",times=repart[2]),rep("C",times=repart[3])))
##D 
##D 
##D BoxPlot(X$num,X$grp,data=X,ylab="num",main="boxplot with confidence intervals")
##D #Confidence interval in red with mean in blue.
##D 
## End(Not run)



