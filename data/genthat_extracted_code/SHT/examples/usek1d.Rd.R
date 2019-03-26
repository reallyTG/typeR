library(SHT)


### Name: usek1d
### Title: Apply k-sample tests for two univariate samples
### Aliases: usek1d

### ** Examples

## No test: 
### compare two-means via anova and t-test
### since they coincide when k=2
x = rnorm(50)
y = rnorm(50)

### run anova and t-test
test1 = usek1d(x, y, "meank.anova")
test2 = mean2.ttest(x,y)

### print the results of comparison
cat(paste("\n* Comparison of ANOVA and t-test'\n\n",
sprintf("* p-value from ANOVA   : %.4f\n",test1$p.value),
sprintf("*              t-test  : %.4f\n",test2$p.value),sep=""))
## End(No test)




