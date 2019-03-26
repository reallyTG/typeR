library(revengc)


### Name: cnbinom.pars
### Title: Estimation of negative binomial parameters
### Aliases: cnbinom.pars
### Keywords: negative binomial univariate table frequency table count data
###   censored mu dispersion

### ** Examples


# create frequency table that follows a Poisson distribution
set.seed(123)
testdata1<-data.frame(table(rpois(100000,lambda = 10)))

# negative binomial converges in distribution to the Poisson 
## when dispersion->infinity
cnbinom.pars(testdata1)

# censor table of testdata1 (lambda = 10)
testdata2<-cbind(as.character(c("<=5", "6-10", "11-15", "16-20", ">20")), 
  c(6718,51329,37041,4732, 180))
cnbinom.pars(testdata2)

# create frequency table that follows a negative binomial distribution
# different ways to parameterize the negative binomial distribution
mu = 10
r = 2
p = r/(r+mu)
set.seed(123)
testdata3<-data.frame(table(rnbinom(100000, size = r, mu = mu)))
cnbinom.pars(testdata3)
set.seed(123)
testdata4<-data.frame(table(rnbinom(100000, size = r, p = p)))
cnbinom.pars(testdata4)

# censor table with mu = 10 and r = 2 
testdata5<-cbind(as.character(c("<5", "5-15", "16I26", "27-37", "38I48", ">48")), 
  c(26130,53979,15899,3267, 593, 132))
cnbinom.pars(testdata5)



