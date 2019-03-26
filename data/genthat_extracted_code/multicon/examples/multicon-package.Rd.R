library(multicon)


### Name: multicon-package
### Title: Multivariate Constructs
### Aliases: multicon-package multicon
### Keywords: multivariate constructs replicability personality psychology
###   within-person profile analyses

### ** Examples

# Some examples of the core functions in the multicon package:

# Is personality related to behavior? This simple question becomes more
# complex with the recognition that both personality and behavior are multivariate constructs.
# One (of many) ways to quantify personality is with a a 100-item measure,
# the California Adult Q-set (CAQ: Block, 1961). And one (of a few) ways to
# quantify behavior is with a 67-item measure, the Riverside Behavioral Q-sort
# (RBQ: Funder, Furr, & Colvin, Colvin, 2000; Furr, Wagerman, & Funder, 2010).

# How well are these two instruments related? There are 100 * 67 = 6700
# possible correlations that could be examined one at a time. Alternatively,
# we could answer our question more directly by simply seeing what the
# (absolute) average correlation is amongst these two sets of items and testing
# it against a baseline model that assumes zero association. The function
# rand.test() does this.

data(caq)
data(v2rbq)
	# Note that in practice more sims (i.e., 1000 or more) might be preffered
rand.test(caq, v2rbq, sims=100, graph=FALSE)

# How is a specific single variable of interest (e.g., Extraversion) related
# to some multivariate construct (e.g., behavior - as measured by the RBQ)?
# Do the relationships differ by sex? The function q.cor() is
# designed to answer this question.

data(RSPdata)
  # Note that in practice more sims (i.e., 1000 or more) might be preffered
myobj <- q.cor(RSPdata$sEXT, v2rbq, sex = RSPdata$ssex, fem = 1, male = 2, sims=100) 
myobj
  # The results can be organized by using q.cor.print() for easier interpretation
data(rbqv3.items)
q.cor.print(myobj, rbqv3.items, "RBQ", short=TRUE)

# How well do two judgments of a target's personality agree with each other?
# Again, assuming personality is measured as a multivariate construct
# (e.g., the 100-item CAQ), this question is not so straightforward. One way
# is to correlate the two judge's ratings across the 100-item pairs (profile correlation).
# This can be done for each target with two judges. The function Profile.r() does this.

data(acq1) # The first friend of a target being judged (N targets = 205)
data(acq2) # The second friend of a target being judged

Profile.r(acq1, acq2) # The agreements (correlations) for each target
  # Get summary statistics for the agreements
describe.r(Profile.r(acq1, acq2))
  # If we want to control for normativeness (see Furr, 2008) and get
  # significance tests (for both overall and distinctive agreement) we
  # can simply set distinct=TRUE.
Profile.r(acq1, acq2, distinct=TRUE)
  # If we want to know how replicable (reliable) the agreement correaltions are
  # we can use Profile.r.rep()
Profile.r.rep(acq1, acq2)

# The package also includes some graphing functions for comparing group means
# based on "The New Statistics" (Cumming, 2012).
y <- c(rnorm(30), rnorm(30, mean=1))
group <- rep(1:2, each=30)
catseye(y, group, las=1, main="A Catseye Plot", xlab="", 
	grp.names=c("Control", "Experimental"), ylab="DV")
catseye(y, group, las=1, main="A Catseye Plot #2", xlab="", 
	grp.names=c("Control", "Experimental"), ylab="DV", conf=.80, col="cyan")
df=data.frame(group=group,y=y)
diffPlot(y ~ group,data=df,grp.names=c("Control", "Experimental"), xlab="", 
	ylab="DV", main="A Difference Plot", sub="Arms are 95 percent CIs")



