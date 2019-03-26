library(latentnet)


### Name: summary.ergmm
### Title: ERGMM Fit Summaries
### Aliases: summary.ergmm print.summary.ergmm summary.ergmm.object
###   bic.ergmm
### Keywords: graphs models print

### ** Examples


## No test: 
data(sampson)
# Fit the model for cluster sizes 1 through 4:
fits<-list(
           ergmm(samplike~euclidean(d=2,G=1)),
           ergmm(samplike~euclidean(d=2,G=2)),
           ergmm(samplike~euclidean(d=2,G=3)),
           ergmm(samplike~euclidean(d=2,G=4))
           )

## Not run: 
##D # Optionally, plot all fits.
##D lapply(fits,plot)
## End(Not run)

# Compute the BICs for the fits and plot them:
(bics<-reshape(
    as.data.frame(t(sapply(fits,
                           function(x)c(G=x$model$G,unlist(bic.ergmm(x))[c("Y","Z","overall")])))),
    list(c("Y","Z","overall")),idvar="G",v.names="BIC",timevar="Component",
    times=c("likelihood","clustering","overall"),direction="long"
    ))

with(bics,interaction.plot(G,Component,BIC,type="b",xlab="Clusters", ylab="BIC"))

# Summarize and plot whichever fit has the lowest overall BIC:
bestG<-with(bics[bics$Component=="overall",],G[which.min(BIC)])
summary(fits[[bestG]])
plot(fits[[bestG]])
## End(No test)




