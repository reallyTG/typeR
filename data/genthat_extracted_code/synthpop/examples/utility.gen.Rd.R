library(synthpop)


### Name: utility.gen
### Title: Distributional comparison of synthesised and observed data
### Aliases: utility.gen print.utility.gen

### ** Examples

## Not run: 
##D   ods <- SD2011[1:1000, c("age", "bmi", "depress", "alcabuse", "englang")]
##D   s1 <- syn(ods, m = 5)
##D   utility.gen(s1, ods)
##D   u1 <- utility.gen(s1, ods)
##D   print(u1, print.zscores = TRUE, usethresh = TRUE)
##D   u2 <- utility.gen(s1, ods, groups = TRUE)
##D   print(u2, print.zscores = TRUE)
##D   u3 <- utility.gen(s1, ods, method = "cart", nperms = 20)
##D   print(u3, print.variable.importance = TRUE)
## End(Not run)



