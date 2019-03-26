library(Hmisc)


### Name: summary.formula
### Title: Summarize Data for Making Tables and Plots
### Aliases: summary.formula stratify print.summary.formula.response
###   plot.summary.formula.response latex.summary.formula.response
###   print.summary.formula.reverse plot.summary.formula.reverse
###   latex.summary.formula.reverse [.summary.formula.response
###   print.summary.formula.cross latex.summary.formula.cross
###   formula.summary.formula.cross na.retain cumcategory conTestkw
###   catTestchisq ordTestpo
### Keywords: category interface hplot manip

### ** Examples

options(digits=3)
set.seed(173)
sex <- factor(sample(c("m","f"), 500, rep=TRUE))
age <- rnorm(500, 50, 5)
treatment <- factor(sample(c("Drug","Placebo"), 500, rep=TRUE))

# Generate a 3-choice variable; each of 3 variables has 5 possible levels
symp <- c('Headache','Stomach Ache','Hangnail',
          'Muscle Ache','Depressed')
symptom1 <- sample(symp, 500,TRUE)
symptom2 <- sample(symp, 500,TRUE)
symptom3 <- sample(symp, 500,TRUE)
Symptoms <- mChoice(symptom1, symptom2, symptom3, label='Primary Symptoms')
table(Symptoms)

# Note: In this example, some subjects have the same symptom checked
# multiple times; in practice these redundant selections would be NAs
# mChoice will ignore these redundant selections

#Frequency table sex*treatment, sex*Symptoms
summary(sex ~ treatment + Symptoms, fun=table)
# could also do summary(sex ~ treatment +
#  mChoice(symptom1,symptom2,symptom3), fun=table)


#Compute mean age, separately by 3 variables
summary(age ~ sex + treatment + Symptoms)


f <- summary(treatment ~ age + sex + Symptoms, method="reverse", test=TRUE)
f
# trio of numbers represent 25th, 50th, 75th percentile
print(f, long=TRUE)
plot(f)
plot(f, conType='bp', prtest='P')
bpplt()    # annotated example showing layout of bp plot

#Compute predicted probability from a logistic regression model
#For different stratifications compute receiver operating
#characteristic curve areas (C-indexes)
predicted <- plogis(.4*(sex=="m")+.15*(age-50))
positive.diagnosis <- ifelse(runif(500)<=predicted, 1, 0)
roc <- function(z) {
   x <- z[,1];
   y <- z[,2];
   n <- length(x);
   if(n<2)return(c(ROC=NA));
   n1 <- sum(y==1);
   c(ROC= (mean(rank(x)[y==1])-(n1+1)/2)/(n-n1) );
 }
y <- cbind(predicted, positive.diagnosis)
options(digits=2)
summary(y ~ age + sex, fun=roc)


options(digits=3)
summary(y ~ age + sex, fun=roc, method="cross")

#Use stratify() to produce a table in which time intervals go down the
#page and going across 3 continuous variables are summarized using
#quartiles, and are stratified by two treatments

set.seed(1)
d <- expand.grid(visit=1:5, treat=c('A','B'), reps=1:100)
d$sysbp <- rnorm(100*5*2, 120, 10)
label(d$sysbp) <- 'Systolic BP'
d$diasbp <- rnorm(100*5*2, 80,  7)
d$diasbp[1] <- NA
d$age    <- rnorm(100*5*2, 50, 12)
g <- function(y) {
  N <- apply(y, 2, function(w) sum(!is.na(w)))
  h <- function(x) {
    qu <- quantile(x, c(.25,.5,.75), na.rm=TRUE)
    names(qu) <- c('Q1','Q2','Q3')
    c(N=sum(!is.na(x)), qu)
}
  w <- as.vector(apply(y, 2, h))
  names(w) <- as.vector( outer(c('N','Q1','Q2','Q3'), dimnames(y)[[2]],
                                function(x,y) paste(y,x)))
  w
}
#Use na.rm=FALSE to count NAs separately by column
s <- summary(cbind(age,sysbp,diasbp) ~ visit + stratify(treat),
             na.rm=FALSE, fun=g, data=d)
#The result is very wide.  Re-do, putting treatment vertically
x <- with(d, factor(paste('Visit', visit, treat)))
summary(cbind(age,sysbp,diasbp) ~ x, na.rm=FALSE, fun=g, data=d)

#Compose LaTeX code directly
g <- function(y) {
  h <- function(x) {
    qu <- format(round(quantile(x, c(.25,.5,.75), na.rm=TRUE),1),nsmall=1)
    paste('{\\scriptsize(',sum(!is.na(x)),
          ')} \\hfill{\\scriptsize ', qu[1], '} \\textbf{', qu[2],
          '} {\\scriptsize ', qu[3],'}', sep='')
  }
  apply(y, 2, h)
}
s <- summary(cbind(age,sysbp,diasbp) ~ visit + stratify(treat),
             na.rm=FALSE, fun=g, data=d)
# latex(s, prn=FALSE)
## need option in latex to not print n
#Put treatment vertically
s <- summary(cbind(age,sysbp,diasbp) ~ x, fun=g, data=d, na.rm=FALSE)
# latex(s, prn=FALSE)

#Plot estimated mean life length (assuming an exponential distribution) 
#separately by levels of 4 other variables.  Repeat the analysis
#by levels of a stratification variable, drug.  Automatically break
#continuous variables into tertiles.
#We are using the default, method='response'
## Not run: 
##D life.expect <- function(y) c(Years=sum(y[,1])/sum(y[,2]))
##D attach(pbc)
##D S <- Surv(follow.up.time, death)
##D s2 <- summary(S ~ age + albumin + ascites + edema + stratify(drug),
##D                          fun=life.expect, g=3)
##D 
##D 
##D #Note: You can summarize other response variables using the same 
##D #independent variables using e.g. update(s2, response~.), or you 
##D #can change the list of independent variables using e.g. 
##D #update(s2, response ~.- ascites) or update(s2, .~.-ascites)
##D #You can also print, typeset, or plot subsets of s2, e.g.
##D #plot(s2[c('age','albumin'),]) or plot(s2[1:2,])
##D 
##D 
##D s2    # invokes print.summary.formula.response
##D 
##D 
##D #Plot results as a separate dot chart for each of the 3 strata levels
##D par(mfrow=c(2,2))
##D plot(s2, cex.labels=.6, xlim=c(0,40), superposeStrata=FALSE)
##D 
##D 
##D #Typeset table, creating s2.tex
##D w <- latex(s2, cdec=1)
##D #Typeset table but just print LaTeX code
##D latex(s2, file="")    # useful for Sweave
##D 
##D 
##D #Take control of groups used for age.  Compute 3 quartiles for
##D #both cholesterol and bilirubin (excluding observations that are missing
##D #on EITHER ONE)
##D 
##D 
##D age.groups <- cut2(age, c(45,60))
##D g <- function(y) apply(y, 2, quantile, c(.25,.5,.75))
##D y <- cbind(Chol=chol,Bili=bili)
##D label(y) <- 'Cholesterol and Bilirubin'
##D #You can give new column names that are not legal S names
##D #by enclosing them in quotes, e.g. 'Chol (mg/dl)'=chol
##D 
##D 
##D s <- summary(y ~ age.groups + ascites, fun=g)
##D 
##D 
##D par(mfrow=c(1,2), oma=c(3,0,3,0))   # allow outer margins for overall
##D for(ivar in 1:2) {                  # title 
##D   isub <- (1:3)+(ivar-1)*3          # *3=number of quantiles/var.
##D   plot(s3, which=isub, main='', 
##D        xlab=c('Cholesterol','Bilirubin')[ivar],
##D        pch=c(91,16,93))            # [, closed circle, ]
##D   }
##D mtext(paste('Quartiles of', label(y)), adj=.5, outer=TRUE, cex=1.75)  
##D #Overall (outer) title
##D 
##D 
##D prlatex(latex(s3, trios=TRUE)) 
##D # trios -> collapse 3 quartiles
##D 
##D 
##D #Summarize only bilirubin, but do it with two statistics:
##D #the mean and the median.  Make separate tables for the two randomized
##D #groups and make plots for the active arm.
##D 
##D 
##D g <- function(y) c(Mean=mean(y), Median=median(y))
##D 
##D 
##D for(sub in c("D-penicillamine", "placebo")) {
##D   ss <- summary(bili ~ age.groups + ascites + chol, fun=g,
##D                 subset=drug==sub)
##D   cat('\n',sub,'\n\n')
##D   print(ss)
##D 
##D 
##D   if(sub=='D-penicillamine') {
##D     par(mfrow=c(1,1))
##D     plot(s4, which=1:2, dotfont=c(1,-1), subtitles=FALSE, main='')
##D     #1=mean, 2=median     -1 font = open circle
##D     title(sub='Closed circle: mean;  Open circle: median', adj=0)
##D     title(sub=sub, adj=1)
##D   }
##D 
##D 
##D   w <- latex(ss, append=TRUE, fi='my.tex', 
##D              label=if(sub=='placebo') 's4b' else 's4a',
##D              caption=paste(label(bili),' {\\em (',sub,')}', sep=''))
##D   #Note symbolic labels for tables for two subsets: s4a, s4b
##D   prlatex(w)
##D }
##D 
##D 
##D #Now consider examples in 'reverse' format, where the lone dependent
##D #variable tells the summary function how to stratify all the 
##D #'independent' variables.  This is typically used to make tables 
##D #comparing baseline variables by treatment group, for example.
##D 
##D 
##D s5 <- summary(drug ~ bili + albumin + stage + protime + sex + 
##D                      age + spiders,
##D               method='reverse')
##D #To summarize all variables, use summary(drug ~., data=pbc)
##D #To summarize all variables with no stratification, use
##D #summary(~a+b+c) or summary(~.,data=...)
##D 
##D 
##D options(digits=1)
##D print(s5, npct='both')
##D #npct='both' : print both numerators and denominators
##D plot(s5, which='categorical')
##D Key(locator(1))  # draw legend at mouse click
##D par(oma=c(3,0,0,0))  # leave outer margin at bottom
##D plot(s5, which='continuous')
##D Key2()           # draw legend at lower left corner of plot
##D                  # oma= above makes this default key fit the page better
##D 
##D 
##D options(digits=3)
##D w <- latex(s5, npct='both', here=TRUE)     
##D # creates s5.tex
##D 
##D 
##D #Turn to a different dataset and do cross-classifications on possibly 
##D #more than one independent variable.  The summary function with 
##D #method='cross' produces a data frame containing the cross-
##D #classifications.  This data frame is suitable for multi-panel 
##D #trellis displays, although `summarize' works better for that.
##D 
##D 
##D attach(prostate)
##D size.quartile <- cut2(sz, g=4)
##D bone <- factor(bm,labels=c("no mets","bone mets"))
##D 
##D 
##D s7 <- summary(ap>1 ~ size.quartile + bone, method='cross')
##D #In this case, quartiles are the default so could have said sz + bone
##D 
##D 
##D options(digits=3)
##D print(s7, twoway=FALSE)
##D s7   # same as print(s7)
##D w <- latex(s7, here=TRUE)   # Make s7.tex
##D 
##D 
##D library(trellis,TRUE)
##D invisible(ps.options(reset=TRUE))
##D trellis.device(postscript, file='demo2.ps')
##D 
##D 
##D dotplot(S ~ size.quartile|bone, data=s7, #s7 is name of summary stats
##D                   xlab="Fraction ap>1", ylab="Quartile of Tumor Size")
##D #Can do this more quickly with summarize:
##D # s7 <- summarize(ap>1, llist(size=cut2(sz, g=4), bone), mean,
##D #                 stat.name='Proportion')
##D # dotplot(Proportion ~ size | bone, data=s7)
##D 
##D 
##D summary(age ~ stage, method='cross')
##D summary(age ~ stage, fun=quantile, method='cross')
##D summary(age ~ stage, fun=smean.sd, method='cross')
##D summary(age ~ stage, fun=smedian.hilow, method='cross')
##D summary(age ~ stage, fun=function(x) c(Mean=mean(x), Median=median(x)),
##D         method='cross')
##D #The next statements print real two-way tables
##D summary(cbind(age,ap) ~ stage + bone, 
##D         fun=function(y) apply(y, 2, quantile, c(.25,.75)),
##D         method='cross')
##D options(digits=2)
##D summary(log(ap) ~ sz + bone,
##D         fun=function(y) c(Mean=mean(y), quantile(y)),
##D         method='cross')
##D 
##D 
##D #Summarize an ordered categorical response by all of the needed
##D #cumulative proportions
##D summary(cumcategory(disease.severity) ~ age + sex)
##D 
## End(Not run)



