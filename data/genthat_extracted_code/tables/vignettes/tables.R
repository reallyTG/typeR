### R code from vignette source 'tables.Rnw'

###################################################
### code chunk number 1: tables.Rnw:26-27
###################################################
options(width=60)


###################################################
### code chunk number 2: tables.Rnw:47-48
###################################################
library(tables)


###################################################
### code chunk number 3: iris
###################################################
tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )


###################################################
### code chunk number 4: tables.Rnw:58-61
###################################################
latex(
tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )
)


###################################################
### code chunk number 5: tables.Rnw:68-69 (eval = FALSE)
###################################################
## booktabs()


###################################################
### code chunk number 6: tables.Rnw:73-75
###################################################
saved.options <- table_options()
booktabs()


###################################################
### code chunk number 7: irisbook
###################################################
latex(
tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )
)


###################################################
### code chunk number 8: tables.Rnw:142-149
###################################################
set.seed(100)
X <- rnorm(10)
X
A <- sample(letters[1:2], 10, rep=TRUE)
A
F <- factor(A)
F


###################################################
### code chunk number 9: tables.Rnw:289-290
###################################################
saved.options


###################################################
### code chunk number 10: tables.Rnw:297-298
###################################################
table_options()[c("toprule", "midrule", "bottomrule", "titlerule")]


###################################################
### code chunk number 11: tables.Rnw:302-303 (eval = FALSE)
###################################################
## latex(
## tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
##          (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )
## )


###################################################
### code chunk number 12: tables.Rnw:306-307
###################################################
latex(
tabular( (Species + 1) ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris )
)


###################################################
### code chunk number 13: split (eval = FALSE)
###################################################
## latex(tabular(Species ~ (n=1) + Format(digits=2)*
##          (Sepal.Length + Sepal.Width)*(mean + sd), data=iris),
##       options=list(doFooter=FALSE, doEnd=FALSE))
## cat("\\ \\\\ \\multicolumn{6}{l}{
## \\textit{Overall, we see the following: }} \\\\
## \\ \\\\")
## latex(tabular(1 ~ (n=1) + Format(digits=2)*
##          (Sepal.Length + Sepal.Width)*(mean + sd), data=iris),
##       options=list(doBegin=FALSE, doHeader=FALSE))


###################################################
### code chunk number 14: tables.Rnw:325-326
###################################################
latex(tabular(Species ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris),
      options=list(doFooter=FALSE, doEnd=FALSE))
cat("\\ \\\\ \\multicolumn{6}{l}{
\\textit{Overall, we see the following: }} \\\\
\\ \\\\")
latex(tabular(1 ~ (n=1) + Format(digits=2)*
         (Sepal.Length + Sepal.Width)*(mean + sd), data=iris),
      options=list(doBegin=FALSE, doHeader=FALSE))


###################################################
### code chunk number 15: tables.Rnw:379-380
###################################################
latex( tabular(F + 1 ~ 1) )


###################################################
### code chunk number 16: tables.Rnw:395-396
###################################################
latex( tabular( X*F*(mean + sd) ~ 1 ) )


###################################################
### code chunk number 17: tables.Rnw:408-409
###################################################
latex( tabular( X*F ~ mean + sd ) )


###################################################
### code chunk number 18: tables.Rnw:423-424
###################################################
latex( tabular( X*(Newname=F) ~ mean + sd ) )


###################################################
### code chunk number 19: tables.Rnw:447-448
###################################################
latex( tabular( (F+1) ~ (n=1) + X*(mean + sd) ) )


###################################################
### code chunk number 20: tables.Rnw:460-463
###################################################
latex( tabular( (i = factor(seq_along(X)))  ~ 
       Heading()*identity*(X+A + 
              (F = as.character(F) ) ) ) ) 


###################################################
### code chunk number 21: tables.Rnw:473-475
###################################################
latex( tabular( (X > 0) + (X < 0)  + 1
    ~ ((n = 1) + X*(mean + sd)) ) )


###################################################
### code chunk number 22: tables.Rnw:505-507
###################################################
latex( tabular( I(X > 0) + I(X < 0)  
    ~ ((n=1) + mean + sd) ) )


###################################################
### code chunk number 23: tables.Rnw:542-544
###################################################
latex( tabular( (F+1) ~ (n=1) 
           + Format(digits=2)*X*(mean + sd) ) )


###################################################
### code chunk number 24: tables.Rnw:555-564
###################################################
stderr <- function(x) sd(x)/sqrt(length(x))
fmt <- function(x, digits, ...) {
  s <- format(x, digits=digits, ...)
  is_stderr <- (1:length(s)) > length(s) %/% 2
  s[is_stderr] <- sprintf("$(%s)$", s[is_stderr])
  s[!is_stderr] <- latexNumeric(s[!is_stderr])
  s
}
latex( tabular( Format(fmt(digits=1))*(F+1) ~ X*(mean + stderr) ) )


###################################################
### code chunk number 25: tables.Rnw:578-580
###################################################
latex( tabular( (F+1) ~ X*(Format(digits=2)*mean 
                    + (n=1) + .Format(1)*sd) ) )


###################################################
### code chunk number 26: tables.Rnw:612-614
###################################################
latex( tabular( (Heading("$\\Phi$")*F+1) ~ (n=1) 
           + Format(digits=2)*Heading()*X*(mean + sd) ) )


###################################################
### code chunk number 27: tables.Rnw:621-623
###################################################
latex( tabular( X*F + Heading("near")*X 
		+ Heading("far", nearData = FALSE)*X ~ mean + sd ) )


###################################################
### code chunk number 28: tables.Rnw:637-639
###################################################
latex( tabular( Justify(r)*(F+1) ~ Justify(c)*(n=1) 
   + Justify(c,r)*Format(digits=2)*X*(mean + sd) ) )


###################################################
### code chunk number 29: tables.Rnw:679-685 (eval = FALSE)
###################################################
## latex( tabular( (Factor(gear, "Gears") + 1)
##           *((n=1) + Percent() 
##             + (RowPct=Percent("row")) 
##             + (ColPct=Percent("col"))) 
##          ~ (Factor(carb, "Carburetors") + 1)
##           *Format(digits=1), data=mtcars ) )


###################################################
### code chunk number 30: tables.Rnw:686-692
###################################################
latex( tabular( (Factor(gear, "Gears") + 1)
          *((n=1) + Percent() 
            + (RowPct=Percent(Equal(gear)))  # Equal, not "row"
            + (ColPct=Percent(Equal(carb)))) # Equal, not "col"
         ~ (Factor(carb, "Carburetors") + 1)
          *Format(digits=1), data=mtcars ) )


###################################################
### code chunk number 31: tables.Rnw:716-722
###################################################
# This is the example from the weighted.mean help page
wt <- c(5,  5,  4,  1)/15
x <- c(3.7,3.3,3.5,2.8)
gp <- c(1,1,2,2)
latex( tabular( (Factor(gp) + 1) 
                ~ weighted.mean*x*Arguments(w = wt) ) )


###################################################
### code chunk number 32: tables.Rnw:726-728 (eval = FALSE)
###################################################
## latex( tabular( (Factor(gp) + 1) 
##                 ~ Arguments(x, w = wt)*weighted.mean ) )


###################################################
### code chunk number 33: tables.Rnw:753-760
###################################################
set.seed(730)
df <- data.frame(Label = LETTERS[1:9], 
		 Group = rep(letters[1:3], each=3), 
		 Value = rnorm(9), 
		 stringsAsFactors = TRUE)
latex( tabular( Label ~ Group*Value*mean, 
		data = df[1:6,]))


###################################################
### code chunk number 34: tables.Rnw:765-768
###################################################
latex( tabular( Label ~ Group*Value*mean*
			DropEmpty(empty="."), 
		data = df[1:6,]))


###################################################
### code chunk number 35: tables.Rnw:811-812
###################################################
latex( tabular( Species ~ Heading()*mean*All(iris), data=iris) )


###################################################
### code chunk number 36: tables.Rnw:825-828
###################################################
df <- mtcars[1:10,]
latex( tabular(Factor(cyl)*Factor(gear)*AllObs(df) ~ 
               rownames(df) + mpg, data=df) )


###################################################
### code chunk number 37: tables.Rnw:843-847
###################################################
rownum <- with(mtcars, RowNum(list(cyl, gear)))
latex( tabular(Factor(cyl)*Factor(gear)*I(rownum) ~
        mpg * AllObs(mtcars, within = list(cyl, gear, rownum)), 
        data=mtcars) )


###################################################
### code chunk number 38: tables.Rnw:856-861
###################################################
rownum <- with(mtcars, RowNum(list(cyl, gear), perrow = 2))
latex( tabular(Factor(cyl)*Factor(gear)*
	       AllObs(mtcars, within = list(cyl, gear, rownum)) ~
               mpg * I(rownum), 
        data=mtcars) )


###################################################
### code chunk number 39: tables.Rnw:886-888
###################################################
latex( tabular( Species + Hline(2:5) + 1 
                         ~ Heading()*mean*All(iris), data=iris) )


###################################################
### code chunk number 40: tables.Rnw:927-930
###################################################
stderr <- function(x) sd(x)/sqrt(length(x))
latex( tabular( (Species+1) ~ All(iris)*
          PlusMinus(mean, stderr, digits=1), data=iris ) )


###################################################
### code chunk number 41: tables.Rnw:962-969
###################################################
lcl <- function(x) mean(x) - qt(0.975, df=length(x)-1)*stderr(x)
ucl <- function(x) mean(x) + qt(0.975, df=length(x)-1)*stderr(x)
latex( tabular( (Species+1) ~ All(iris)*
          Paste(lcl, ucl, digits=2, 
                head="95\\% CI", sep=",", prefix="[",
                postfix="]"), 
          data=iris ) )


###################################################
### code chunk number 42: tables.Rnw:1013-1016
###################################################
subset <- 1:15
latex( tabular( RowFactor(subset, "$i$", spacing=5)  ~ 
       All(iris[subset,], factor=as.character)*Heading()*identity ) )


###################################################
### code chunk number 43: tables.Rnw:1023-1032
###################################################
set.seed(1000)
dat <- expand.grid(Block=1:3, Treatment=LETTERS[1:2], 
                                Subset=letters[1:2])
dat$Response <- rnorm(12)
latex( tabular( RowFactor(Block, spacing=1)
                * RowFactor(Treatment, spacing=1, space=0.5)
                * Factor(Subset)
                ~ Response*Heading()*identity, data=dat),
                options=list(rowlabeljustification="c"))


###################################################
### code chunk number 44: tables.Rnw:1054-1062
###################################################
subset <- 1:50
latex( tabular( RowFactor(subset, "$i$", spacing=5, 
                                             suppressfirst=FALSE)  ~ 
       All(iris[subset,], factor=as.character)*Heading()*identity ),
       options = list(tabular="longtable",
          toprule="\\caption{This table crosses page boundaries.}\\\\
              \\toprule",
midrule="\\midrule\\\\[-2\\normalbaselineskip]\\endhead\\hline\\endfoot") )


###################################################
### code chunk number 45: tables.Rnw:1071-1075
###################################################
subset <- 1:10
latex( tabular( Factor(subset)  ~ 
       All(iris[subset,], factor=as.character)*Heading()*identity, 
       suppress=3 ) )


###################################################
### code chunk number 46: tables.Rnw:1090-1093 (eval = FALSE)
###################################################
## code <- capture.output( latex( tab ) )
## code <- sub("^(.*)(\\\\nopagebreak )", "\\2\\1", code)
## cat(code, sep = "\n")


###################################################
### code chunk number 47: tables.Rnw:1099-1102
###################################################
latex( tabular( Multicolumn(Species, width=3, 
            levelnames=paste("\\textit{Iris", levels(Species),"}")) 
            * (mean + sd)  ~ All(iris), data=iris, suppress=1))


###################################################
### code chunk number 48: tables.Rnw:1149-1150
###################################################
df <- data.frame(A = factor(c( "$", "\\" ) ), B_label=1:2)


###################################################
### code chunk number 49: tables.Rnw:1153-1154 (eval = FALSE)
###################################################
## latex( tabular( mean ~ A*B_label, data=df ) ) 


###################################################
### code chunk number 50: tables.Rnw:1158-1159
###################################################
latex( tabular( mean ~ Factor(A)*All(df), data=df ) ) 


###################################################
### code chunk number 51: tables.Rnw:1177-1180
###################################################
dat <- data.frame( a = c(1, 2, 3, NA), b = 1:4 )
mean(dat$a)
mean(dat$a, na.rm=TRUE)


###################################################
### code chunk number 52: tables.Rnw:1188-1190
###################################################
Mean <- function(x) base::mean(x, na.rm=TRUE)
latex( tabular( Mean ~ a + b, data=dat ) )


###################################################
### code chunk number 53: tables.Rnw:1196-1197
###################################################
latex( tabular( mean ~ a + b, data = na.omit(dat) ) )


###################################################
### code chunk number 54: tables.Rnw:1203-1206
###################################################
latex( tabular( 
  Mean ~ (1 + Heading(Complete)*complete.cases(dat)) * (a + b), 
               data=dat ) )


###################################################
### code chunk number 55: tables.Rnw:1216-1220
###################################################
A <- factor(dat$a)
latex( tabular( A + 1 ~ (n=1)) )
A <- factor(dat$a, exclude = NULL)
latex( tabular( A + 1 ~ (n=1) ) )


###################################################
### code chunk number 56: tables.Rnw:1230-1239
###################################################
set.seed(1206)
q <- data.frame(p = rep(c("A","B"),each=10,len=30),
                           a = rep(c(1,2,3),each=10),id=seq(30),
                           b = round(runif(30,10,20)),
                           c = round(runif(30,40,70)),
		stringsAsFactors = FALSE)
tab <- tabular((Factor(p)*Factor(a)+1) 
                        ~ (N = 1) + (b + c)*(mean+sd),data=q)
latex(tab)


###################################################
### code chunk number 57: tables.Rnw:1245-1246
###################################################
latex(tab[ tab[,1] > 0, ])


###################################################
### code chunk number 58: tables.Rnw:1253-1260
###################################################
formula <- Factor(p)*Factor(a) ~ 
	   (N = 1) + (b + c)*(mean+sd)
tab <- NULL
for (sub in c("A", "B")) 
    tab <- rbind(tab, tabular( formula, 
                               data = subset(q, p == sub) ) )
latex(tab)


###################################################
### code chunk number 59: tables.Rnw:1266-1270
###################################################
colLabels(tab)
labs <- colLabels(tab)
labs[1, 2] <- "New label"
colLabels(tab) <- labs


###################################################
### code chunk number 60: tables.Rnw:1273-1274
###################################################
latex(tab)


###################################################
### code chunk number 61: tables.Rnw:1303-1308
###################################################
library(magrittr)
library(kableExtra)
toKable(tab) %>% 
  kable_styling(full_width = TRUE) %>%
  column_spec(4, color = "red")


