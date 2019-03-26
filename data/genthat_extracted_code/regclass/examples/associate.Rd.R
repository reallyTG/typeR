library(regclass)


### Name: associate
### Title: Association Analysis
### Aliases: associate

### ** Examples

  #Two quantitative variables
  data(SALARY)
	associate(Salary~Education,data=SALARY,permutations=1000)
	
	#y is quantitative while x is categorical
	data(SURVEY11)
	associate(X07.GPA~X40.FavAlcohol,data=SURVEY11,permutations=0,classic=TRUE)
	
	#y is categorical while x is quantitative
	data(WINE)
	associate(Quality~alcohol,data=WINE,classic=TRUE,n.levels=5) 

  #Two categorical variables (many cases, turns off prompt asking for user input)
  data(ACCOUNT)
  set.seed(320)
  #Work with a smaller subset
  SUBSET <- ACCOUNT[sample(nrow(ACCOUNT),1000),]
	associate(Purchase~Area.Classification,data=SUBSET,classic=TRUE,prompt=FALSE)
	
	 


