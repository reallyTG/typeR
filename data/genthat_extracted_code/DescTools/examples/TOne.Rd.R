library(DescTools)


### Name: TOne
### Title: Create Table One Describing Baseline Characteristics
### Aliases: TOne
### Keywords: IO

### ** Examples

opt <- DescToolsOptions()

# define some special formats for count data, percentages and numeric results
# (those will be supported by TOne)
Fmt(abs=as.fmt(digits=0, big.mark="'"))
Fmt(per=as.fmt(digits=1, fmt="%"))
Fmt(num=as.fmt(digits=1, big.mark="'"))

TOne(x = d.pizza[, c("temperature","delivery_min","driver","wine_ordered")],
     grp=d.pizza$quality)

# define median/IQR as describing functions for the numeric variables
TOne(iris[, -5], iris[, 5],
  FUN = function(x) gettextf("%s / %s",
         Format(median(x, na.rm=TRUE), digits=1),
         Format(IQR(x, na.rm=TRUE), digits=3))
)

# replace kruskal.test by ANOVA and report the p.value
# Change tests for all the types
TOne(x = iris[, -5], grp = iris[, 5],
     FUN = function(x) gettextf("%s / %s",
            Format(mean(x, na.rm=TRUE), digits=1),
            Format(sd(x, na.rm=TRUE), digits=3)),

     TEST=list(num=list(fun=function(x, g){summary(aov(x ~ g))[[1]][1, "Pr(>F)"]},
                        lbl="ANOVA"),
               cat=list(fun=function(x, g){chisq.test(table(x, g))$p.val},
                        lbl="Chi-Square test"),
               dich=list(fun=function(x, g){fisher.test(table(x, g))$p.val},
                         lbl="Fisher exact test")),
     fmt.pval = as.fmt(fmt="p", na.form="   ")
)

# dichotomous integer or logical values can be reported by the high or low value
x <- sample(x = c(0,1), size = 100, prob = c(0.3, 0.7), replace = TRUE)
y <- sample(x = c(0,1), size = 100, prob = c(0.3, 0.7), replace = TRUE)==1
z <- factor(sample(x = c(0,1), size = 100, prob = c(0.3, 0.7), replace = TRUE))
g <- sample(x = letters[1:4], size = 100, replace = TRUE)
d.set <- data.frame(x=x, y=y, z=z, g=g)

TOne(d.set[1:3], d.set$g, intref = "low")
TOne(d.set[1:3], d.set$g, intref = "high")

# intref would not control factors, use relevel to change reported value
TOne(data.frame(z=relevel(z, "1")), g)
TOne(data.frame(z=z), g)


options(opt)

## Not run: 
##D   --  Send the whole stuff to Word
##D 
##D wrd <- GetNewWrd()
##D ToWrd(TOne(x = d.pizza[, c("temperature","delivery_min","driver","wine_ordered")],
##D            grp=d.pizza$quality))
##D            
## End(Not run)



