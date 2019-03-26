library(biomod2)


### Name: makeFormula
### Title: Standardized formula maker
### Aliases: makeFormula
### Keywords: models, formula, options

### ** Examples


# create simulated data
myResp <- sample(c(0,1),20, replace=TRUE)
myExpl <- matrix(runif(60), ncol=3, dimnames=list(NULL,c('var1','var2','var3')))

# create a formula
myFormula <- makeFormula( respName = 'myResp', 
                          explVar = head(myExpl), 
                          type = 'quadratic', 
                          interaction.level = 0)
# show formula created
myFormula




