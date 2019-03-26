library(Hmisc)


### Name: describe
### Title: Concise Statistical Description of a Vector, Matrix, Data Frame,
###   or Formula
### Aliases: describe describe.default describe.vector describe.matrix
###   describe.formula describe.data.frame plot.describe print.describe
###   print.describe.single [.describe latex.describe latex.describe.single
###   html.describe html.describe.single formatdescribeSingle
### Keywords: interface nonparametric category distribution robust models
###   hplot

### ** Examples

set.seed(1)
describe(runif(200),dig=2)    #single variable, continuous
                              #get quantiles .05,.10,...

dfr <- data.frame(x=rnorm(400),y=sample(c('male','female'),400,TRUE))
describe(dfr)

## Not run: 
##D options(grType='plotly')
##D d <- describe(mydata)
##D p <- plot(d)   # create plots for both types of variables
##D p[[1]]; p[[2]] # or p$Categorical; p$Continuous
##D plotly::subplot(p[[1]], p[[2]], nrows=2)  # plot both in one
##D plot(d, which='categorical')    # categorical ones
##D 
##D d <- sas.get(".","mydata",special.miss=TRUE,recode=TRUE)
##D describe(d)      #describe entire data frame
##D attach(d, 1)
##D describe(relig)  #Has special missing values .D .F .M .R .T
##D                  #attr(relig,"label") is "Religious preference"
##D 
##D #relig : Religious preference  Format:relig
##D #    n missing  D  F M R T distinct 
##D # 4038     263 45 33 7 2 1        8
##D #
##D #0:none (251, 6%), 1:Jewish (372, 9%), 2:Catholic (1230, 30%) 
##D #3:Jehovah's Witnes (25, 1%), 4:Christ Scientist (7, 0%) 
##D #5:Seventh Day Adv (17, 0%), 6:Protestant (2025, 50%), 7:other (111, 3%) 
##D 
##D 
##D # Method for describing part of a data frame:
##D  describe(death.time ~ age*sex + rcs(blood.pressure))
##D  describe(~ age+sex)
##D  describe(~ age+sex, weights=freqs)  # weighted analysis
##D 
##D  fit <- lrm(y ~ age*sex + log(height))
##D  describe(formula(fit))
##D  describe(y ~ age*sex, na.action=na.delete)   
##D # report on number deleted for each variable
##D  options(na.detail.response=TRUE)  
##D # keep missings separately for each x, report on dist of y by x=NA
##D  describe(y ~ age*sex)
##D  options(na.fun.response="quantile")
##D  describe(y ~ age*sex)   # same but use quantiles of y by x=NA
##D 
##D  d <- describe(my.data.frame)
##D  d$age                   # print description for just age
##D  d[c('age','sex')]       # print description for two variables
##D  d[sort(names(d))]       # print in alphabetic order by var. names
##D  d2 <- d[20:30]          # keep variables 20-30
##D  page(d2)                # pop-up window for these variables
##D 
##D # Test date/time formats and suppression of times when they don't vary
##D  library(chron)
##D  d <- data.frame(a=chron((1:20)+.1),
##D                  b=chron((1:20)+(1:20)/100),
##D                  d=ISOdatetime(year=rep(2003,20),month=rep(4,20),day=1:20,
##D                                hour=rep(11,20),min=rep(17,20),sec=rep(11,20)),
##D                  f=ISOdatetime(year=rep(2003,20),month=rep(4,20),day=1:20,
##D                                hour=1:20,min=1:20,sec=1:20),
##D                  g=ISOdate(year=2001:2020,month=rep(3,20),day=1:20))
##D  describe(d)
##D 
##D # Make a function to run describe, latex.describe, and use the kdvi
##D # previewer in Linux to view the result and easily make a pdf file
##D 
##D  ldesc <- function(data) {
##D   options(xdvicmd='kdvi')
##D   d <- describe(data, desc=deparse(substitute(data)))
##D   dvi(latex(d, file='/tmp/z.tex'), nomargins=FALSE, width=8.5, height=11)
##D  }
##D 
##D  ldesc(d)
## End(Not run)



