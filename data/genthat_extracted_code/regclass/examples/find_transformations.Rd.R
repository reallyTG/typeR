library(regclass)


### Name: find_transformations
### Title: Transformations for simple linear regression
### Aliases: find.transformations find_transformations

### ** Examples

  #Straightforward example
  data(BULLDOZER)
	M <- lm(SalePrice~YearMade,data=BULLDOZER)
	find_transformations(M,pch=20,cex=0.3)

  #Results are very misleading since selected models have high R2 due to outliers
  data(MOVIE)
  M <- lm(Total~Weekend,data=MOVIE)
	find_transformations(M,powers=seq(-2,2,by=0.5),threshold=0.05)
	 


