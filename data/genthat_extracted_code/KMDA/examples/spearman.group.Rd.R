library(KMDA)


### Name: spearman.group
### Title: Grouping Based on Spearman Correlation Coefficients
### Aliases: spearman.group

### ** Examples

	nr=20
	nc=10	
	temp= sample(c(0,1,2,3),size=nr*nc, replace = TRUE,prob=c(0.4,0.2,0.2,0.2))
	x=matrix(temp,nrow=nr,ncol=nc)
	spearman.group(x,0.5)



