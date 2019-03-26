library(ergm)


### Name: ergm-terms
### Title: Terms used in Exponential Family Random Graph Models
### Aliases: ergm-terms ergm.terms terms-ergm terms.ergm InitErgmTerm
###   absdiff absdiffcat altkstar asymmetric atleast atmost b1concurrent
###   b1cov b1degrange b1degree b1factor b1mindegree b1nodematch b1star
###   b1starmix b1twostar b2concurrent b2cov b2degrange b2degree b2factor
###   b2mindegree b2nodematch b2star b2starmix b2twostar balance
###   coincidence concurrent concurrentties ctriad ctriple cycle
###   cyclicalties cyclicalweights ddsp degcor degcrossprod degrange degree
###   degree1.5 degreepopularity diff density desp dgwdsp dgwesp dgwnsp
###   dnsp dsp dyadcov edgecov edges esp equalto greaterthan gwb1degree
###   gwb2degree gwdegree gwdsp gwesp gwidegree gwnsp gwodegree hamming
###   hammingmix idegrange idegree idegree1.5 idegreepopularity ininterval
###   intransitive isolates istar kstar localtriangle m2star match mm
###   meandeg mutual nearsimmelian nodecov nodecovar nodefactor nodeicov
###   nodeicovar nodeifactor nodeisqrtcovar nodemain nodematch nodemix
###   nodeocov nodeocovar nodeofactor nodeosqrtcovar nodesqrtcovar nonzero
###   nsp odegrange odegree odegree1.5 odegreepopularity opentriad ostar
###   receiver sender simmelian simmelianties smalldiff smallerthan
###   sociality sum threepath threetrail transitive transitiveties
###   transitiveweights triadcensus triangle triangles tripercent ttriad
###   ttriple twopath
### Keywords: models

### ** Examples

## Not run: 
##D ergm(flomarriage ~ kstar(1:2) + absdiff("wealth") + triangle)
##D 
##D ergm(molecule ~ edges + kstar(2:3) + triangle
##D                       + nodematch("atomic type",diff=TRUE)
##D                       + triangle + absdiff("atomic type"))
## End(Not run)



