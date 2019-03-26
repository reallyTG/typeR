library(random.polychor.pa)


### Name: random.polychor.pa
### Title: A Parallel Analysis with Randomly Generated Polychoric
###   Correlation Matrices
### Aliases: random.polychor.pa
### Keywords: PARALLEL ANALYSIS POLYCHORIC CORRELATION MATRIX UNIFORM
###   DISTRIBUTION MULTINOMIAL DISTRIBUTION MULTIGROUP BOOTSTRAP FIT
###   INDEXES EXPLORATORY FACTOR ANALYSIS

### ** Examples

### EXAMPLE 1:
### this example is particularly instructive on how the solution may
### change by changing the type of correlation, method of extraction and
### method of selection.
require(psych)
data(bfi)
names(bfi)
bfi.data<-na.exclude(as.matrix(bfi[1:200, 1:5])) 
head(bfi.data)
random.polychor.pa(nrep=3, data.matrix=bfi.data, q.eigen=.99)

### EXAMPLE 2:
### in this example one of the categories of item1 is recoded: 2=1
### so this item has 5 categories: 1 (2) 3 4 5 6
### category 1 is within brackets as it has frequency=0
### so this is a case where empirical data (0 2 3 4 5 6) diverge from
### theorethical data (0 1 2 3 4 5 6)
#require(psych)
#data(bfi)
#raw.data.1<-as.matrix(bfi)
#raw.data.1 <- (raw.data.1[1:200,1:25])
#for(i in 1:nrow(raw.data.1)) { if(raw.data.1[i,1]==2) raw.data.1[i,1]<-1} 
#test.2<-random.polychor.pa(nrep=100, data.matrix=raw.data.1, q.eigen=.99)
#test.2

### EXAMPLE 3:
######## for SPSS users ####
### the following instructions can used to load a SPSS data file (.sav).
### 1) load the library to read external datafile (e.g., SPSS datafile)
### 2) choose the SPSS datafile by pointing directly in the folder 
#      on your hard-disk
### 3) select only the variables (i.e., the items) needed to for 
#      Parallel Analysis
#> library(foreign) ### load the needed library
#> raw.data <- read.spss(choose.files(), use.value.labels=TRUE,
#                       max.value.labels=Inf, to.data.frame=TRUE)
#> raw.spss.item <- na.exclude(raw.data[,2:4])
#> summary (raw.spss.item)
#> random.polychor.pa(nrep=5, data.matrix=raw.spss.item, q.eigen=.99)

### EXAMPLE 4a:
### in this case the paramether diff.fact is set to TRUE, so the function 
### will simulate random dataset with the same probability of occurrence
### of each category for each item in the observed dataset. 
### Dichotomous variables are used in this example.
#require(psych)
#data(bock)
### DICHTOMOUS
#random.polychor.pa(nrep=3, data.matrix=lsat6, q.eigen=.99, diff.fact=TRUE)

### EXAMPLE 4b:
### in this case the paramether diff.fact is set to TRUE, so the function 
### will simulate random dataset with the same probability of occurrence
### of each category for each item in the observed dataset. 
### Polythomous variables are used in this example.
#require(psych)
#data(bfi)
#raw.data.4a<-as.matrix(bfi)
#raw.data.4a <- (raw.data.4a[1:200,1:25])
### POLYTHOMOUS
#random.polychor.pa(nrep=100, data.matrix=raw.data.4a, q.eigen=.99, diff.fact=TRUE)

### EXAMPLE 5:
### RANDOM VS BOOSTRAP SIMULATED DATA
### UNIFORM VS MULTINOMIAL DISTRIBUTION
#require(psych)
#data(bfi)
#names(bfi)
#bfi.data<-na.exclude(as.matrix(bfi[1:200, 1:5])) 
#head(bfi.data)
### RANDOM samples and UNIFORM distribution
#random.polychor.pa(nrep=100, data.matrix=bfi.data, q.eigen=.95, comparison=c("random"), 
#		distr="uniform", fit.pa=T, print.all=T) 
### RANDOM samples and MULTINOMIAL distribution
#random.polychor.pa(nrep=100, data.matrix=bfi.data, q.eigen=.95, comparison=c("random"), 
#		distr="multinomial", fit.pa=T, print.all=T) 

### BOOTSTRAP and UNIFORM distribution
#random.polychor.pa(nrep=100, data.matrix=bfi.data, q.eigen=.95, comparison=c("bootstrap"), 
#		distr="uniform", fit.pa=T, print.all=T) 
### BOOTSTRAP and MULTINOMIAL distribution
#random.polychor.pa(nrep=100, data.matrix=bfi.data, q.eigen=.95, comparison=c("bootstrap"), 
#		distr="multinomial", fit.pa=T, print.all=T) 


### EXAMPLE 6:
### MULTIGROUP PARALLEL ANALYSIS: 2 samples
#require(psych)
#data(bfi)
#names(bfi)
#table(bfi$gender)
#table(bfi$education)
#table(bfi$age)
#bfi.data.gender<-cbind(bfi[1:200, 26], bfi[1:200, 1:5])
#head(bfi.data.gender)

# MULTIGROUP PARALLEL ANALYSIS: RANDOM UNIFORM
#random.polychor.pa(nrep=100, data.matrix=bfi.data.gender, q.eigen=.95, comparison=c("random-mg"),
#		distr="uniform", fit.pa=T, print.all=T) 
# MULTIGROUP PARALLEL ANALYSIS: RANDOM MULTINOMIAL
#random.polychor.pa(nrep=100, data.matrix=bfi.data.gender, q.eigen=.95, comparison=c("random-mg"),
#		distr="multinomial", fit.pa=T, print.all=T) 

# MULTIGROUP PARALLEL ANALYSIS: BOOTSTRAP UNIFORM
#random.polychor.pa(nrep=100, data.matrix=bfi.data.gender, q.eigen=.95, 
#		comparison=c("bootstrap-mg"), distr="uniform", fit.pa=T, print.all=T) 
# MULTIGROUP PARALLEL ANALYSIS: BOOTSTRAP MULTINOMIAL
#random.polychor.pa(nrep=100, data.matrix=bfi.data.gender, q.eigen=.95, 
#		comparison=c("bootstrap-mg"), distr="multinomial", fit.pa=T, print.all=T) 


### EXAMPLE 7:
### MULTIGROUP PARALLEL ANALYSIS: 11 samples
#require(psych)
#data(bfi)
#names(bfi)
#table(bfi$age)
#raw.data<- subset(bfi, bfi$age>=17 & bfi$age<=27)
#table(raw.data$age)
#bfi.data.age<-cbind(raw.data[, 28], raw.data[, 1:10])
#head(bfi.data.age)

#random.polychor.pa(nrep=100, data.matrix=bfi.data.age, q.eigen=.95, comparison=c("random-mg")) 



