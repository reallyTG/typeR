library(regclass)


### Name: see_interactions
### Title: Examining pairwise interactions between quantitative variables
###   for a fitted regression model
### Aliases: see.interactions see_interactions

### ** Examples

  
  data(SALARY)
	M <- lm(Salary~.^2,data=SALARY)
	#see_interactions(M,many=TRUE)  #not run since it requires user input
	
	data(STUDENT)
	M <- lm(CollegeGPA~(Gender+HSGPA+Family)^2+HSGPA*ACT,data=STUDENT)
	see_interactions(M,cex=0.6)
	 


