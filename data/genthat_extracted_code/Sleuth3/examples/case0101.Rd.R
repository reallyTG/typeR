library(Sleuth3)


### Name: case0101
### Title: Motivation and Creativity
### Aliases: case0101
### Keywords: datasets

### ** Examples

attach(case0101)  
str(case0101)  
boxplot(Score ~ Treatment)  # Basic boxplots for each level of Treatment

boxplot(Score ~ Treatment,  # Boxplots with labels
  ylab= "Average Creativity Score From 11 Judges (on a 40-point scale)",  
  names=c("23 'Extrinsic' Group Students","24 'Intrinsic' Group Students"), 
  main= "Haiku Creativity Scores for 47 Creative Writing Students") 

detach(case0101)



