library(qboxplot)


### Name: qboxplot
### Title: Quantile-Based Boxplots
### Aliases: qboxplot
### Keywords: qboxplot

### ** Examples

#Example 1
data = data.frame(a=runif(10), b=runif(10), c=runif(10))
qboxplot(data, range=1.3, probs=c(0.2,0.5,0.7), qtype=6)

#Example 2
qboxplot(count~spray, data=InsectSprays, col="lightgray")

#Example 3
rb = qboxplot(decrease~treatment, data=OrchardSprays, log="y", col="bisque")
title("")
rb

#Example 4
mat = cbind(Uni05=(1:100)/21, Norm=rnorm(100), "5T"=rt(100,df=5),
            Gam2=rgamma(100,shape=2))
qboxplot(as.data.frame(mat))

#Example 5
data = c(102,133,136,139,142,144,146,151,160,174)
qboxplot(data.frame(data), range=1.5, probs=c(0.25,0.5,0.75), qtype=1,
         ylim=c(100,220), horizontal=TRUE)




