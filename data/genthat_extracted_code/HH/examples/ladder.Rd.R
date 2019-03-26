library(HH)


### Name: ladder
### Title: Draw a "ladder of powers" plot, plotting each of several powers
###   of y against the same powers of x.
### Aliases: ladder ladder3 ladder.f ladder.fstar strip.ladder
### Keywords: hplot dplot manip

### ** Examples

data(tv)

## default
## R: outer strip labels
## S-Plus: one strip label per panel (too full for this example, see below)
ladder(life.exp ~ ppl.per.phys, data=tv,
       main="Ladder of Powers for Life Expectancy and People per Physician")

## Not run: 
##D ## one strip label
##D if.R(r=ladder(life.exp ~ ppl.per.phys, data=tv, strip.number=1, useOuter=FALSE,
##D               dsx="ppp", dsy="le"),
##D      s=ladder(life.exp ~ ppl.per.phys, data=tv, strip.number=1,
##D               dsx="ppp", dsy="le")) ## S-Plus default
##D 
##D ## two strip labels
##D if.R(r=ladder(life.exp ~ ppl.per.phys, data=tv, strip.number=2, useOuter=FALSE),
##D      s=ladder(life.exp ~ ppl.per.phys, data=tv, strip.number=2,
##D               axis3.line=1.2))
##D 
##D ## outer strip labels
##D if.R(r=ladder(life.exp ~ ppl.per.phys, data=tv, useOuter=TRUE), ## R default
##D      s={}) ## S-Plus not available
##D 
##D ## no strip labels (probably silly, but possible)
##D if.R(r=ladder(life.exp ~ ppl.per.phys, data=tv, strip.number=0, useOuter=FALSE),
##D      s=ladder(life.exp ~ ppl.per.phys, data=tv, strip.number=0,
##D               axis3.line=0))
## End(Not run)



