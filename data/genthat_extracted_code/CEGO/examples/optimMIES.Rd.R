library(CEGO)


### Name: optimMIES
### Title: Mixed Integer Evolution Strategy (MIES)
### Aliases: optimMIES

### ** Examples

set.seed(1)
controlList <- list(lower=c(-5,-5,1,1,NA,NA),upper=c(10,5,10,10,NA,NA),
		types=c("numeric","numeric","integer","integer","factor","factor"),
	levels=list(NA,NA,NA,NA,c("a","b","c"),1:4),
		vectorized = FALSE)
objFun <- function(x){		
		x[[3]] <- round(x[[3]])
		x[[4]] <- round(x[[4]])
		y <- sum(as.numeric(x[1:4])^2) 
		if(x[[5]]=="a" & x[[5]]==4)
			y <- exp(y)
		else
			y <- y^2
		if(x[[5]]=="b")
			y<-y-1	
		if(x[[5]]=="c")
			y<-y-2	
		if(x[[6]]==1)
			y<-y*2
		if(x[[6]]==2)
			y<-y * 1.54
		if(x[[6]]==3)
			y<- y +2
		if(x[[6]]==4)
			y<- y * 0.5	
		if(x[[5]]=="a")
			y<- y * 9	
		y	
	}
res <- optimMIES(,objFun,controlList)
res$xbest
res$ybest




