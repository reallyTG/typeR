library(agridat)


### Name: lu.stability
### Title: Multi-environment trial of maize, to illustrate stability
###   statistics
### Aliases: lu.stability
### Keywords: datasets

### ** Examples


data(lu.stability)
dat <- lu.stability

## Not run: 
##D   
##D # GxE means. Match Lu 1995 table 1
##D require(reshape2)
##D datm <- acast(dat, gen~env, fun=mean, value.var='yield')
##D round(datm, 2)
##D # Gen/Env means. Match Lu 1995 table 3
##D apply(datm, 1, mean)
##D apply(datm, 2, mean)
##D 
##D   
##D # Traditional ANOVA. Match Hwu table 2
##D # F value for gen,env
##D m1 = aov(yield~env+gen+Error(block:env+env:gen), data=dat)
##D summary(m1)   
##D # F value for gen:env, block:env
##D m2 <- aov(yield ~ gen + env + gen:env + block:env, data=dat) 
##D summary(m2)
##D 
##D # Finlay Wilkinson regression coefficients
##D # First, calculate env mean, merge in
##D require(dplyr)
##D   dat2 <- group_by(dat, env)
##D   dat2 <- mutate(dat2, loc.mean=mean(yield))
##D m4 <- lm(yield ~ gen -1 + gen:loc.mean, data=dat2)
##D coef(m4) # Match Hwu table 4
##D 
##D # Table 6: Shukla's heterogeneity test
##D dat2$ge = gl(5,6) # Create a separate ge interaction term  
##D m6 <- lm(yield ~ gen + env + ge + ge:loc.mean, data=dat2)
##D m6b <- lm( yield ~ gen + env + ge + loc.mean, data=dat2)
##D anova(m6, m6b) # Non-significant difference
##D 
##D # Table 7 - Shukla stability
##D # First, environment means
##D   emn <- group_by(dat2, env)
##D   emn <- summarize(emn, ymn=mean(yield))
##D # Regress GxE terms on envt means
##D getab = (model.tables(m2,"effects")$tables)$'gen:env'
##D getab
##D for (ll in 1:nrow(getab)){
##D   m7l <- lm(getab[ll, ] ~ emn$ymn)
##D   cat("\n\n*************** Gen ",ll," ***************\n") 
##D   cat("Regression coefficient: ",round(coefficients(m7l)[2],5),"\n") 
##D   print(anova(m7l)) 
##D } # Match Hwu table 7.
##D 
## End(Not run) # dontrun




