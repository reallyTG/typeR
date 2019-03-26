library(mtk)


### Name: make.mtkFactor
### Title: The 'make.mtkFactor' function
### Aliases: make.mtkFactor

### ** Examples


# Define a new continuous factor 
	make.mtkFactor("A", distribName="unif", distribPara=list(min=0,max=1))
# Define a new discrete factor 
	make.mtkFactor("D", distribName="discrete", distribPara =
				list(type='categorical', levels=c('a','b','c'), 
				weights=rep(0.33,3))
				)
	



