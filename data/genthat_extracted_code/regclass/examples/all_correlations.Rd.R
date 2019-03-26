library(regclass)


### Name: all_correlations
### Title: Pairwise correlations between quantitative variables
### Aliases: all_correlations all.correlations

### ** Examples

	#all pairwise (Pearson) correlations between all quantitative variables
	data(STUDENT)
	all_correlations(STUDENT)  
	#Spearman correlations between all quantitative variables and CollegeGPA, sorted by pvalue. 
	#Gives warnings due to ties
	all_correlations(STUDENT,interest="CollegeGPA",type="spearman",sorted="significance")
	 


