library(netmeta)


### Name: pairwise
### Title: Transform meta-analysis data from two arm-based formats into
###   contrast-based format
### Aliases: pairwise

### ** Examples

# Example using continuous outcomes (internal call of function metacont)
#
data(parkinson)
# Transform data from arm-based format to contrast-based format
p1 <- pairwise(list(Treatment1, Treatment2, Treatment3),
               n=list(n1, n2, n3),
               mean=list(y1, y2, y3),
               sd=list(sd1, sd2, sd3),
               data=parkinson, studlab=Study)
p1

# Conduct network meta-analysis
net1 <- netmeta(p1)
net1

# Draw network graphs
netgraph(net1, points=TRUE, cex.points=3, cex=1.5,
         thickness="se.fixed")
netgraph(net1, points=TRUE, cex.points=3, cex = 1.5,
         plastic=TRUE, thickness="se.fixed",
         iterate=TRUE)
netgraph(net1, points=TRUE, cex.points=3, cex = 1.5,
         plastic=TRUE, thickness="se.fixed",
         iterate=TRUE, start="eigen")


#
# Example using generic outcomes (internal call of function metagen)
#
# Calculate standard error for means y1, y2, y3
parkinson$se1 <- with(parkinson, sqrt(sd1^2 / n1))
parkinson$se2 <- with(parkinson, sqrt(sd2^2 / n2))
parkinson$se3 <- with(parkinson, sqrt(sd3^2 / n3))
# Transform data from arm-based format to contrast-based format using
# means and standard errors (note, argument 'sm' has to be used to
# specify that argument 'TE' is a mean difference)
p2 <- pairwise(list(Treatment1, Treatment2, Treatment3),
               TE=list(y1, y2, y3),
               seTE=list(se1, se2, se3),
               n=list(n1, n2, n3),
               data=parkinson, studlab=Study,
               sm="MD")
p2

# Compare pairwise objects p1 (based on continuous outcomes) and p2
# (based on generic outcomes)
all.equal(p1[, c("TE", "seTE", "studlab", "treat1", "treat2")],
          p2[, c("TE", "seTE", "studlab", "treat1", "treat2")])

# Same result as network meta-analysis based on continuous outcomes
# (object net1)
## Not run: 
##D   net2 <- netmeta(p2)
##D   net2
## End(Not run)


#
# Example with binary data
#
data(smokingcessation)
# Transform data from arm-based format to contrast-based format
# (interal call of metabin function). Argument 'sm' has to be used for
# odds ratio as risk ratio (sm="RR") is default of metabin function.
p3 <- pairwise(list(treat1, treat2, treat3),
               list(event1, event2, event3),
               list(n1, n2, n3),
               data=smokingcessation,
               sm="OR")
p3

# Conduct network meta-analysis
net3 <- netmeta(p3)
net3

#
# Example with incidence rates
#
data(dietaryfat)

# Transform data from arm-based format to contrast-based format
p4 <- pairwise(list(treat1, treat2, treat3),
               list(d1, d2, d3),
               time=list(years1, years2, years3),
               studlab=ID,
               data=dietaryfat)
p4

# Conduct network meta-analysis using incidence rate ratios (sm="IRR").
# Note, the argument 'sm' is not necessary as this is the default in R
# function metainc called internally
net4 <- netmeta(p4, sm="IRR")
summary(net4)

#
# Example with long data format
#
data(Woods2010)

# Transform data from long arm-based format to contrast-based format
# Argument 'sm' has to be used for odds ratio as summary measure; by
# default the risk ratio is used in the metabin function called
# internally.
p5 <- pairwise(treatment, event=r, n=N,
               studlab=author, data=Woods2010, sm="OR")
p5

# Conduct network meta-analysis
net5 <- netmeta(p5)
net5



