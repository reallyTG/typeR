library(rms)


### Name: rms
### Title: rms Methods and Generic Functions
### Aliases: rms Design
### Keywords: models regression survival math manip methods

### ** Examples

## Not run: 
##D require(rms)
##D dist <- datadist(data=2)     # can omit if not using summary, (gg)plot, survplot,
##D                              # or if specify all variable values to them. Can
##D                              # also  defer.  data=2: get distribution summaries
##D                              # for all variables in search position 2
##D                              # run datadist once, for all candidate variables
##D dist <- datadist(age,race,bp,sex,height)   # alternative
##D options(datadist="dist")
##D f <- cph(Surv(d.time, death) ~ rcs(age,4)*strat(race) +
##D          bp*strat(sex)+lsp(height,60),x=TRUE,y=TRUE)
##D anova(f)
##D anova(f,age,height)          # Joint test of 2 vars
##D fastbw(f)
##D summary(f, sex="female")     # Adjust sex to "female" when testing
##D                              # interacting factor bp
##D bplot(Predict(f, age, height))   # 3-D plot
##D ggplot(Predict(f, age=10:70, height=60))
##D latex(f)                     # LaTeX representation of fit
##D 
##D 
##D f <- lm(y ~ x)               # Can use with any fitting function that
##D                              # calls model.frame.default, e.g. lm, glm
##D specs.rms(f)                 # Use .rms since class(f)="lm"
##D anova(f)                     # Works since Varcov(f) (=Varcov.lm(f)) works
##D fastbw(f)
##D options(datadist=NULL)
##D f <- ols(y ~ x1*x2)          # Saves enough information to do fastbw, anova
##D anova(f)                     # Will not do Predict since distributions
##D fastbw(f)                    # of predictors not saved
##D plot(f, x1=seq(100,300,by=.5), x2=.5) 
##D                              # all values defined - don't need datadist
##D dist <- datadist(x1,x2)      # Equivalent to datadist(f)
##D options(datadist="dist")
##D plot(f, x1, x2=.5)        # Now you can do plot, summary
##D plot(nomogram(f, interact=list(x2=c(.2,.7))))
## End(Not run)



