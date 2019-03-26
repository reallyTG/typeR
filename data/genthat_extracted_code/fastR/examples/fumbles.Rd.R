library(fastR)


### Name: fumbles
### Title: NCAA football fumbles
### Aliases: fumbles
### Keywords: datasets

### ** Examples


data(fumbles)
m <- max(fumbles$week1)
table(factor(fumbles$week1,levels=0:m))
favstats( ~ week1, data=fumbles)
# compare with Poisson distribution
signif( cbind(
		  fumbles=0:m,
		  observedCount=table(factor(fumbles$week1,levels=0:m)),
		  modelCount= 120* dpois(0:m,mean(fumbles$week1)),
		  observedPct=table(factor(fumbles$week1,levels=0:m))/120,
		  modelPct= dpois(0:m,mean(fumbles$week1))
	) ,3)
showFumbles <- function(x,lambda=mean(x),...) {
	mx <- max(x)
    result <- histogram(~x, type="density", xlim=c(-.5,(mx+2.5)),
		xlab='number of fumbles',
        panel=function(x,y,...){
            panel.histogram(x,alpha=0.8,breaks=seq(-0.5,(mx+2.5),by=1,...))
            panel.points(0:(mx+2),dpois(0:(mx+2),lambda),pch=19,alpha=0.8)
        }
    )
    print(result)
    return(result)
}
showFumbles(fumbles$week1)
showFumbles(fumbles$week2)
showFumbles(fumbles$week3)




