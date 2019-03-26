library(Epi)


### Name: Termplot
### Title: A wrapper for 'termplot' that optionally (but by default)
###   exponentiates terms, and plot them on a common log-scale. Also scales
###   x-axes to the same physical scale.
### Aliases: Termplot
### Keywords: hplot

### ** Examples

# Get the diabetes data and set up as Lexis object
data(DMlate)
DMlate <- DMlate[sample(1:nrow(DMlate),500),]
dml <- Lexis( entry = list(Per=dodm, Age=dodm-dobth, DMdur=0 ),
               exit = list(Per=dox),
        exit.status = factor(!is.na(dodth),labels=c("DM","Dead")),
               data = DMlate )

# Split in 1-year age intervals
dms <- splitLexis( dml, time.scale="Age", breaks=0:100 )

# Model with 6 knots for both age and period
n.kn <- 6
# Model age-specific rates with period referenced to 2004
( a.kn <- with( subset(dms,lex.Xst=="Dead"),
                quantile( Age+lex.dur, probs=(1:n.kn-0.5)/n.kn ) ) )
( p.kn <- with( subset(dms,lex.Xst=="Dead"),
                quantile( Per+lex.dur, probs=(1:n.kn-0.5)/n.kn ) ) )
m2 <- glm( lex.Xst=="Dead" ~ -1 +
                             Ns( Age, kn=a.kn, intercept=TRUE ) +
                             Ns( Per, kn=p.kn, ref=2004 ),
           offset = log( lex.dur ), family=poisson, data=dms )

# Finally we can plot the two effects:
Termplot( m2, yshr=0.9 )



