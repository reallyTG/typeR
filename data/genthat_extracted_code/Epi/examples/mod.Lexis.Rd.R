library(Epi)


### Name: mod.Lexis
### Title: Fit intensity models to follow-up data in Lexis objects
### Aliases: glm.Lexis gam.Lexis coxph.Lexis
### Keywords: models

### ** Examples

library( Epi )
library( survival )
data( DMlate )

# Lexis object of total follow-up
mL <- Lexis( entry = list(age=dodm-dobth,per=dodm),
              exit = list(per=dox),
       exit.status = factor(!is.na(dodth),labels=c("Alive","Dead")),
              data = DMlate )

# Cut follow-up at start of insulin use
cL <- cutLexis( mL, cut = mL$doins,
              timescale = "per",
              new.state = "Ins",
       precursor.states = "Alive" )

# Split follow-up on age-axis
system.time( sL <- splitLexis( cL, breaks=0:25*4, time.scale="age") )
summary( sL )

# glm models for rates based on the time-split dataset by insulin and sex

# proportional hazards model with insulin as time-dependent variable
mt <- glm.Lexis( sL, resp="Dead",
                     ~ sex + lex.Cst + Ns(age,knots=c(15,3:8*10)) )

# prediction of mortality rates from "Alive" with and without PH assumption
nA <- data.frame( age=40:70, sex="M", lex.Cst="Alive" )
nI <- data.frame( age=40:70, sex="M", lex.Cst="Ins" )
matshade( nA$age, cbind( ci.pred(mt,nA),
                         ci.pred(mt,nI) )*1000, plot=TRUE,
          lwd=3, lty=1, log="y", col=c("black","blue","red"),
          xlab="Age", ylab="Mortality per 1000 PY" )
 
# gam models takes quite some time so we leave it out
## Not run: 
##D mt.gam <- gam.Lexis( sL, "Dead", ~ sex + lex.Cst + s(age), scale=1000 )
##D         
## End(Not run)

# Fit a Cox model with age as baseline time scale and insulin as time-dependent
mt.cox <- coxph.Lexis( sL, "Dead", age ~ sex + lex.Cst )

# Pretty much the same results for regression paramters as the glm:
  ci.exp( mt    , subset="ex" )
# ci.exp( mt.gam, subset="ex" )
  ci.exp( mt.cox, subset="ex" )



