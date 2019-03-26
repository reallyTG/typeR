library(multicon)


### Name: item.resid
### Title: Item Level Residuals
### Aliases: item.resid
### Keywords: residuals

### ** Examples

data(caq)
data(RSPdata)
	#Lets predict California Adult Q-Sort scores from extraversion scores 
	#and compute the residual scores on each CAQ item.
head(caq) 
RSPdata$sEXT
dim(caq)
m.sEXT <- matrix(RSPdata$sEXT, nrow = 205, ncol = 100)
head(m.sEXT)
residuals <- item.resid(m.sEXT,caq)
head(residuals) 



