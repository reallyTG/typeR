library(TeachingDemos)


### Name: simfun
### Title: Create a function to simulate data
### Aliases: simfun
### Keywords: datagen design

### ** Examples

# Create a function to simulate heights for a given dataset

simheight <- simfun( {h <- c(64,69); height<-h[sex]+ rnorm(10,0,3)}, drop='h' )

my.df <- data.frame(sex=rep(c('Male','Female'),each=5))
simdat <- simheight(my.df)
t.test(height~sex, data=simdat)

# a more general version, and have the expression predefined
# (note that this assumes that the levels are Female, Male in that order)

myexpr <- quote({
  n <- length(sex)
  h <- c(64,69)
  height <- h[sex] + rnorm(n,0,3)
})

simheight <- simfun(eval(myexpr), drop=c('n','h'))
my.df <- data.frame(sex=sample(rep(c('Male','Female'),c(5,10))))
(simdat <- simheight(my.df))

# similar to above, but use named parameter vector and index by names

myexpr <- quote({
  n <- length(sex)
  height <- h[ as.character(sex)] + rnorm(n,0,sig)
})

simheight <- simfun(eval(myexpr), drop=c('n','h','sig'), 
  h=c(Male=69,Female=64), sig=3)
my.df <- data.frame( sex=sample(c('Male','Female'),100, replace=TRUE))
(simdat <- simheight(my.df, seed='example'))

# Create a function to simulate Sex and Height for a given sample size 
# (actually it will generate n males and n females for a total of 2*n samples)
# then use it in a set of simulations
simheight <- simfun( {sex <- factor(rep(c('Male','Female'),each=n))
                      height <- h[sex] + rnorm(2*n,0,s)
                      }, drop=c('h','n'), h=c(64,69), s=3)
(simdat <- simheight(list(n=10)))

out5  <- replicate(1000, t.test(height~sex, data=simheight(list(n= 5)))$p.value)
out15 <- replicate(1000, t.test(height~sex, data=simheight(list(n=15)))$p.value)

mean(out5  <= 0.05)
mean(out15 <= 0.05)

# use a fixed population

simstate <- simfun({
  tmp <- state.df[as.character(State),]
  Population <- tmp[['Population']]
  Income <- tmp[['Income']]
  Illiteracy <- tmp[['Illiteracy']]
}, state.df=as.data.frame(state.x77), drop=c('tmp','state.df'))
simstate(data.frame(State=sample(state.name,10)))

# Use simulation, but override setting the seed

simheight <- simfun({
  set.seed(1234)
  h <- c(64,69)
  sex <- factor(rep(c('Female','Male'),each=50))
  height <- round(rnorm(100, rep(h,each=50),3),1)
  sex <- sex[ID]
  height <- height[ID]
}, drop='h')
(newdat <- simheight(list(ID=c(1:5,51:55))))
(newdat2<- simheight(list(ID=1:10)))

# Using a fitted object

fit <- lm(Fertility ~ . , data=swiss)
simfert <- simfun({
  Fertility <- predict(fit, newdata=data)
  Fertility <- Fertility + rnorm(length(Fertility),0,summary(fit)$sigma)
}, drop=c('fit'), fit=fit)

tmpdat <- as.data.frame(lapply(swiss[,-1], 
            function(x) round(runif(100, min(x), max(x)))))
names(tmpdat) <- names(swiss)[-1]
fertdat <- simfert(tmpdat)
head(fertdat)
rbind(coef(fit), coef(lm(Fertility~., data=fertdat)))

# simulate a nested mixed effects model
simheight <- simfun({
  n.city <- length(unique(city))
  n.state <- length(unique(state))
  n <- length(city)
  height <- h[sex] + rnorm(n.state,0,sig.state)[state] + 
    rnorm(n.city,0,sig.city)[city] + rnorm(n,0,sig.e)
}, sig.state=1, sig.city=0.5, sig.e=3, h=c(64,69),
  drop=c('sig.state','sig.city','sig.e','h','n.city','n.state','n'))

tmpdat <- data.frame(state=gl(5,20), city=gl(10,10), 
  sex=gl(2,5,length=100, labels=c('F','M')))
heightdat <- simheight(tmpdat)

# similar to above, but include cost information, this assumes that 
# each new state costs $100, each new city is $10, and each subject is $1
# this shows 2 possible methods

simheight <- simfun({
  n.city <- length(unique(city))
  n.state <- length(unique(state))
  n <- length(city)
  height <- h[sex] + rnorm(n.state,0,sig.state)[state] + 
    rnorm(n.city,0,sig.city)[city] + rnorm(n,0,sig.e)
  cost <- 100 * (!duplicated(state)) + 10*(!duplicated(city)) + 1
  cat('The total cost for this design is $', 100*n.state+10*n.city+1*n, 
  '\n', sep='')
}, sig.state=1, sig.city=0.5, sig.e=3, h=c(64,69),
  drop=c('sig.state','sig.city','sig.e','h','n.city','n.state','n'))

tmpdat <- data.frame(state=gl(5,20), city=gl(10,10), 
  sex=gl(2,5,length=100, labels=c('F','M')))
heightdat <- simheight(tmpdat)
sum(heightdat$cost)


# another mixed model method

simheight <- simfun({
  state <- gl(n.state, n/n.state)
  city <- gl(n.city*n.state, n/n.city/n.state)
  sex <- gl(2, n.city, length=n, labels=c('F','M') )
  height <- h[sex] + rnorm(n.state,0,sig.state)[state] + 
    rnorm(n.city*n.state,0,sig.city)[city] + rnorm(n,0,sig.e)
}, drop=c('n.state','n.city','n','sig.city','sig.state','sig.e','h'))

heightdat <- simheight( list(
  n.state=5, n.city=2, n=100, sig.state=10, sig.city=3, sig.e=1, h=c(64,69)
))




