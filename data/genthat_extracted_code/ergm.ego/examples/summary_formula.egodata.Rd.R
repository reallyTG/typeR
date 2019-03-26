library(ergm.ego)


### Name: summary_formula.egodata
### Title: Calculation of ERGM-style summary statistics for 'egodata'
###   objects.
### Aliases: summary_formula.egodata summary summary_formula

### ** Examples


data(faux.mesa.high)
fmh.ego <- as.egodata(faux.mesa.high)
(nw.summ <- summary(faux.mesa.high~edges+degree(0:3)+nodematch("Race")+
                    nodematch("Sex")+absdiff("Grade")+nodemix("Grade")))

(ego.summ <- summary(fmh.ego~edges+degree(0:3)+nodematch("Race")+nodematch("Sex")+
                     absdiff("Grade")+nodemix("Grade"),
                     scaleto=network.size(faux.mesa.high)))

stopifnot(isTRUE(all.equal(nw.summ,ego.summ)))




