library(Epi)


### Name: Ns
### Title: Natural splines - (cubic splines linear beyond outermost knots)
###   with convenient specification of knots and possibility of centering,
###   detrending and clamping.
### Aliases: Ns
### Keywords: regression

### ** Examples

require(splines)
require(stats)
require(graphics)

ns( women$height, df = 3)
Ns( women$height, knots=c(63,59,71,67) )

# Gives the same results as ns:
summary( lm(weight ~ ns(height, df = 3), data = women) )
summary( lm(weight ~ Ns(height, df = 3), data = women) )

# Get the diabetes data and set up as Lexis object
data(DMlate)
DMlate <- DMlate[sample(1:nrow(DMlate),500),]
dml <- Lexis( entry = list(Per=dodm, Age=dodm-dobth, DMdur=0 ),
               exit = list(Per=dox),
        exit.status = factor(!is.na(dodth),labels=c("DM","Dead")),
               data = DMlate )

# Split follow-up in 1-year age intervals
dms <- splitLexis( dml, time.scale="Age", breaks=0:100 )
summary( dms )

# Model  age-specific rates using Ns with 6 knots
# and period-specific RRs around 2000 with 4 knots
# with the same number of deaths between each pair of knots
n.kn <- 6
( a.kn <- with( subset(dms,lex.Xst=="Dead"),
                quantile( Age+lex.dur, probs=(1:n.kn-0.5)/n.kn ) ) )
n.kn <- 4
( p.kn <- with( subset( dms, lex.Xst=="Dead" ),
                quantile( Per+lex.dur, probs=(1:n.kn-0.5)/n.kn ) ) )
m1 <- glm( lex.Xst=="Dead" ~ Ns( Age, kn=a.kn ) +
                             Ns( Per, kn=p.kn, ref=2000 ),
           offset = log( lex.dur ),
           family = poisson,
             data = dms )

# Plot estimated age-mortality curve for the year 2005 and knots chosen:
nd <- data.frame( Age=seq(40,100,0.1), Per=2005, lex.dur=1000 )
par( mfrow=c(1,2) )
matplot( nd$Age, ci.pred( m1, newdata=nd ),
         type="l", lwd=c(3,1,1), lty=1, col="black", log="y",
         ylab="Mortality rates per 1000 PY", xlab="Age (years)", las=1, ylim=c(1,1000) )
rug( a.kn, lwd=2 )

# Clamped Age effect to the right of rightmost knot.
m1.c <- glm( lex.Xst=="Dead" ~ Ns( Age, kn=a.kn, fixsl=c(FALSE,TRUE) ) +
                               Ns( Per, kn=p.kn, ref=2000 ),
             offset = log( lex.dur ),
             family = poisson,
               data = dms )

# Plot estimated age-mortality curve for the year 2005 and knots chosen.
matplot( nd$Age, ci.pred( m1.c, newdata=nd ),
         type="l", lwd=c(3,1,1), lty=1, col="black", log="y",
         ylab="Mortality rates per 1000 PY", xlab="Age (years)", las=1, ylim=c(1,1000) )
rug( a.kn, lwd=2 )

par( mfrow=c(1,1) )

# Including a linear Age effect of 0.05 to the right of rightmost knot.
m1.l <- glm( lex.Xst=="Dead" ~ Ns( Age, kn=a.kn, fixsl=c(FALSE,TRUE) ) +
                               Ns( Per, kn=p.kn, ref=2000 ),
             offset = log( lex.dur ) + pmax( Age, max( a.kn ) ) * 0.05,
             family = poisson,
               data = dms )

# Plot estimated age-mortality curve for the year 2005 and knots chosen.
nd <- data.frame(Age=40:100,Per=2005,lex.dur=1000)
matplot( nd$Age, ci.pred( m1.l, newdata=nd ),
         type="l", lwd=c(3,1,1), lty=1, col="black", log="y",
         ylab="Mortality rates per 1000 PY", xlab="Age (years)", las=1, ylim=c(1,1000) )
rug( a.kn, lwd=2 )



