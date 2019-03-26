library(PsumtSim)


### Name: calcNumRejects
### Title: Calculate number of cases rejected for repeated simulation of
###   Poisson background and responses grouped into categories.
### Aliases: calcNumRejects
### Keywords: datagen

### ** Examples

  # Calculate number of cases which will be detected as having an effect of 
  # category when there are 4 categories with 2 having different responses and
  # when use a standard F test to detect the category effect.
  pvalFnc<-function(df){anova(glm(resp~category,data=df),test='F')$"Pr(>F)"[2]}
  calcNumRejects(1,c(1,1.5,2,1),6,100,pvalFnc)



