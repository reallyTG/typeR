library(rms)


### Name: gendata
### Title: Generate Data Frame with Predictor Combinations
### Aliases: gendata
### Keywords: methods models regression manip

### ** Examples

set.seed(1)
age <- rnorm(200, 50, 10)
sex <- factor(sample(c('female','male'),200,TRUE))
race <- factor(sample(c('a','b','c','d'),200,TRUE))
y <- sample(0:1, 200, TRUE)
dd <- datadist(age,sex,race)
options(datadist="dd")
f <- lrm(y ~ age*sex + race)
gendata(f)
gendata(f, age=50)
d <- gendata(f, age=50, sex="female")  # leave race=reference category
d <- gendata(f, age=c(50,60), race=c("b","a"))  # 4 obs.
d$Predicted <- predict(f, d, type="fitted")
d      # Predicted column prints at the far right
options(datadist=NULL)
## Not run: 
##D d <- gendata(f, nobs=5, view=TRUE)        # 5 interactively defined obs.
##D d[,attr(d,"names.subset")]             # print variables which varied
##D predict(f, d)
## End(Not run)



