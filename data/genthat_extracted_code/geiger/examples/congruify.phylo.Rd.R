library(geiger)


### Name: congruify.phylo
### Title: ultrametricization of trees from a supplied timetree
### Aliases: congruify.phylo
### Keywords: graphs manip

### ** Examples

sal=get(data(caudata))
res=congruify.phylo(sal$fam, sal$phy, sal$tax, tol=0, scale=NA, ncores=2)
print(res$calibrations)
plot(ladderize(sal$phy,right=FALSE), cex=0.35, type="fan", label.offset=2.5)
plot(ladderize(sal$fam,right=FALSE), cex=0.5, type="fan", label.offset=2.5, no.margin=FALSE)

cat("\n\n\n*** If 'PATHd8' is installed ***, execute the following:
\n\tres=congruify.phylo(sal$fam, sal$phy, sal$tax, tol=0, scale=\"PATHd8\")
\tprint(res)
\n\tplot(res$phy, cex=0.35, type=\"fan\", label.offset=2.5)
\n\tprint(max(branching.times(res$phy)))
\tprint(max(branching.times(sal$fam)))
\tprint(max(branching.times(sal$phy)))\n\n\n")



