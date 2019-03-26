library(JWileymisc)


### Name: formatHtest
### Title: Function to format the reuslts of a hypothesis test as text
### Aliases: formatHtest
### Keywords: misc

### ** Examples

formatHtest(t.test(extra ~ group, data = sleep), type = "t")
formatHtest(anova(aov(mpg ~ factor(cyl), data = mtcars)), type = "F")
formatHtest(chisq.test(c(A = 20, B = 15, C = 25)), type = "chisq")
formatHtest(kruskal.test(Ozone ~ Month, data = airquality))
formatHtest(mantelhaen.test(UCBAdmissions), type = "mh")
formatHtest(cor.test(~ mpg + hp, data = mtcars, method = "pearson"), type = "r_pearson")
formatHtest(cor.test(~ mpg + hp, data = mtcars, method = "kendall"), type = "r_kendall")
formatHtest(cor.test(~ mpg + hp, data = mtcars, method = "spearman"), type = "r_spearman")



