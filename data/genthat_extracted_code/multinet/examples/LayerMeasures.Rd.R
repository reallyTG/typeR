library(multinet)


### Name: Measures: layer comparison
### Title: Network analysis measures
### Aliases: 'Measures: layer comparison' layer.summary.ml
###   layer.comparison.ml

### ** Examples

net <- ml.aucs()

# computing similarity between layer summaries
s1 = layer.summary.ml(net,"facebook",method="entropy.degree")
s2 = layer.summary.ml(net,"lunch",method="entropy.degree")
relative.difference=abs(s1-s2)*2/(abs(s1)+abs(s2))
# other layer summaries
layer.summary.ml(net,"facebook",method="min.degree")
layer.summary.ml(net,"facebook",method="max.degree")
layer.summary.ml(net,"facebook",method="sum.degree")
layer.summary.ml(net,"facebook",method="mean.degree")
layer.summary.ml(net,"facebook",method="sd.degree")
layer.summary.ml(net,"facebook",method="skewness.degree")
layer.summary.ml(net,"facebook",method="kurtosis.degree")
layer.summary.ml(net,"facebook",method="entropy.degree")
layer.summary.ml(net,"facebook",method="CV.degree")
layer.summary.ml(net,"facebook",method="jarque.bera.degree")

# returning the number of common edges divided by the union of all
# edges for all pairs of layers (jaccard.edges)
layer.comparison.ml(net)
# returning the number of common edges divided by the union of all
# edges only for "lunch" and "facebook" (jaccard.edges)
layer.comparison.ml(net,layers=c("lunch","facebook"))
# returning the percentage of actors in the lunch layer that are
# also present in the facebook layer
layer.comparison.ml(net,method="coverage.actors")
# all overlapping-based measures:
layer.comparison.ml(net,method="jaccard.actors")
layer.comparison.ml(net,method="jaccard.edges")
layer.comparison.ml(net,method="jaccard.triangles")
layer.comparison.ml(net,method="coverage.actors")
layer.comparison.ml(net,method="coverage.edges")
layer.comparison.ml(net,method="coverage.triangles")
layer.comparison.ml(net,method="sm.actors")
layer.comparison.ml(net,method="sm.edges")
layer.comparison.ml(net,method="sm.triangles")
layer.comparison.ml(net,method="rr.actors")
layer.comparison.ml(net,method="rr.edges")
layer.comparison.ml(net,method="rr.triangles")
layer.comparison.ml(net,method="kulczynski2.actors")
layer.comparison.ml(net,method="kulczynski2.edges")
layer.comparison.ml(net,method="kulczynski2.triangles")
layer.comparison.ml(net,method="hamann.actors")
layer.comparison.ml(net,method="hamann.edges")
layer.comparison.ml(net,method="hamann.triangles")

# comparison of degree distributions (divergences)
layer.comparison.ml(net,method="dissimilarity.degree")
layer.comparison.ml(net,method="KL.degree")
layer.comparison.ml(net,method="jeffrey.degree")

# statistical degree correlation
layer.comparison.ml(net,method="pearson.degree")
layer.comparison.ml(net,method="rho.degree")



