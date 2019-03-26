library(regclass)


### Name: VIF
### Title: Variance Inflation Factor
### Aliases: VIF

### ** Examples

	#A case where the VIFs are small
	data(SALARY)
	M <- lm(Salary~.,data=SALARY)
	VIF(M)

  #A case where (some of) the VIFs are large
  data(BODYFAT)
  M <- lm(BodyFat~.,data=BODYFAT)
  VIF(M)
	 


