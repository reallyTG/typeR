library(RItools)


### Name: print.xbal
### Title: Printing xBalance Objects
### Aliases: print.xbal print
### Keywords: print

### ** Examples

data(nuclearplants)

xb0<-xBalance(pr~ date + t1 + t2 + cap + ne + ct + bw + cum.n,
              data=nuclearplants)

print(xb0)

xb1<-xBalance(pr~ date + t1 + t2 + cap + ne + ct + bw + cum.n,
         strata = data.frame(unstrat = factor(character(32)),
                             pt = factor(nuclearplants$pt)),
         data = nuclearplants,
         report = c("all"))

str(xb1)

print(xb1)

print(xb1, show.pvals = TRUE)

print(xb1, horizontal = FALSE)

## The following doesn't work yet.
## Not run: 
##D print(xb1, which.vars=c("date","t1"),
##D          which.stats=c("adj.means","z.scores","p.values"))
## End(Not run)

## The following example prints the adjusted means
## labeled as "treatmentvar=0" and "treatmentvar=1" using the
## formula provided to xBalance().

print(xb1,
      which.vars = c("date", "t1"),
      which.stats = c("pr=0", "pr=1", "z", "p"))

## Now, not asking for the omnibus test
xb2 <- xBalance(pr~ date + t1 + t2 + cap + ne + ct + bw + cum.n,
         strata = data.frame(unstrat = factor(character(32)),
                             pt = factor(nuclearplants$pt)),
         data = nuclearplants,
         report = c("all"))

print(xb2, which.strata = "pt")



