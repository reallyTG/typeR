library(Hmisc)


### Name: summaryM
### Title: Summarize Mixed Data Types vs. Groups
### Aliases: summaryM print.summaryM plot.summaryM latex.summaryM
###   html.summaryM
### Keywords: category interface hplot manip

### ** Examples

options(digits=3)
set.seed(173)
sex <- factor(sample(c("m","f"), 500, rep=TRUE))
country <- factor(sample(c('US', 'Canada'), 500, rep=TRUE))
age <- rnorm(500, 50, 5)
sbp <- rnorm(500, 120, 12)
label(sbp) <- 'Systolic BP'
units(sbp) <- 'mmHg'
treatment <- factor(sample(c("Drug","Placebo"), 500, rep=TRUE))
treatment[1]
sbp[1] <- NA

# Generate a 3-choice variable; each of 3 variables has 5 possible levels
symp <- c('Headache','Stomach Ache','Hangnail',
          'Muscle Ache','Depressed')
symptom1 <- sample(symp, 500,TRUE)
symptom2 <- sample(symp, 500,TRUE)
symptom3 <- sample(symp, 500,TRUE)
Symptoms <- mChoice(symptom1, symptom2, symptom3, label='Primary Symptoms')
table(as.character(Symptoms))

# Note: In this example, some subjects have the same symptom checked
# multiple times; in practice these redundant selections would be NAs
# mChoice will ignore these redundant selections

f <- summaryM(age + sex + sbp + Symptoms ~ treatment, test=TRUE)
f
# trio of numbers represent 25th, 50th, 75th percentile
print(f, long=TRUE)
plot(f)    # first specify options(grType='plotly') to use plotly
plot(f, conType='dot', prtest='P')
bpplt()    # annotated example showing layout of bp plot

# Produce separate tables by country
f <- summaryM(age + sex + sbp + Symptoms ~ treatment + country,
              groups='treatment', test=TRUE)
f

## Not run: 
##D getHdata(pbc)
##D s5 <- summaryM(bili + albumin + stage + protime + sex + 
##D                age + spiders ~ drug, data=pbc)
##D 
##D print(s5, npct='both')
##D # npct='both' : print both numerators and denominators
##D plot(s5, which='categorical')
##D Key(locator(1))  # draw legend at mouse click
##D par(oma=c(3,0,0,0))  # leave outer margin at bottom
##D plot(s5, which='continuous')  # see also bpplotM
##D Key2()           # draw legend at lower left corner of plot
##D                  # oma= above makes this default key fit the page better
##D 
##D options(digits=3)
##D w <- latex(s5, npct='both', here=TRUE, file='')
##D 
##D options(grType='plotly')
##D pbc <- upData(pbc, moveUnits = TRUE)
##D s <- summaryM(bili + albumin + alk.phos + copper + spiders + sex ~
##D               drug, data=pbc, test=TRUE)
##D html(s)
##D a <- plot(s)
##D a$Categorical
##D a$Continuous
##D plot(s, which='con')
## End(Not run)



