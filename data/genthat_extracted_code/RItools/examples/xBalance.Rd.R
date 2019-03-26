library(RItools)


### Name: xBalance
### Title: Standardized Differences for Stratified Comparisons
### Aliases: xBalance
### Keywords: design nonparametric

### ** Examples

data(nuclearplants)
##No strata, default output
xBalance(pr~ date + t1 + t2 + cap + ne + ct + bw + cum.n,
         data=nuclearplants)

##No strata, all output
xBalance(pr~ date + t1 + t2 + cap + ne + ct + bw + cum.n,
         data=nuclearplants,
         report=c("all"))

##Stratified, all output
xBalance(pr~.-cost-pt, strata=factor(nuclearplants$pt),
         data=nuclearplants,
         report=c("adj.means", "adj.mean.diffs",
                  "adj.mean.diffs.null.sd",
                  "chisquare.test", "std.diffs",
                  "z.scores", "p.values"))

##Comparing unstratified to stratified, just adjusted means and
#omnibus test
xBalance(pr~ date + t1 + t2 + cap + ne + ct + bw + cum.n,
         strata=list(unstrat=NULL, pt=~pt),
         data=nuclearplants,
         report=c("adj.means", "chisquare.test"))

##Comparing unstratified to stratified, just adjusted means and
#omnibus test
xBalance(pr~ date + t1 + t2 + cap + ne + ct + bw + cum.n,
         strata=data.frame(unstrat=factor('none'),
           pt=factor(nuclearplants$pt)),
         data=nuclearplants,
         report=c("adj.means", "chisquare.test"))

##Missing data handling.
testdata<-nuclearplants
testdata$date[testdata$date<68]<-NA

##na.rm=FALSE by default
xBalance(pr ~ date, data = testdata, report="all")
xBalance(pr ~ date, data = testdata, na.rm = TRUE,report="all")

##To match versions of RItools 0.1-9 and older, impute means
#rather than medians.
##Not run, impfn option is not implemented in the most recent version
## Not run: 
##D xBalance(pr ~ date, data = testdata, na.rm = FALSE,
##D            report="all", impfn=mean.default)
## End(Not run)

##Comparing unstratified to stratified, just one-by-one wilcoxon
#rank sum tests and omnibus test of multivariate differences on
#rank scale.
xBalance(pr~ date + t1 + t2 + cap + ne + ct + bw + cum.n,
         strata=data.frame(unstrat=factor('none'),
           pt=factor(nuclearplants$pt)),
         data=nuclearplants,
         report=c("adj.means", "chisquare.test"),
	 post.alignment.transform=rank)



