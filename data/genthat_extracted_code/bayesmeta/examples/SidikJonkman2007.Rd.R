library(bayesmeta)


### Name: SidikJonkman2007
### Title: Postoperative complication odds example data
### Aliases: SidikJonkman2007
### Keywords: datasets

### ** Examples

data("SidikJonkman2007")
# add log-odds-ratios and corresponding standard errors:
sj <- SidikJonkman2007
sj <- cbind(sj, "log.or"=log(sj[,"lihr.events"])-log(sj[,"lihr.cases"]-sj[,"lihr.events"])
                             -log(sj[,"oihr.events"])+log(sj[,"oihr.cases"]-sj[,"oihr.events"]),
            "log.or.se"=sqrt(1/sj[,"lihr.events"] + 1/(sj[,"lihr.cases"]-sj[,"lihr.events"])
                             + 1/sj[,"oihr.events"] + 1/(sj[,"oihr.cases"]-sj[,"oihr.events"])))

## Not run: 
##D # analysis using weakly informative Cauchy prior
##D # (may take a few seconds to compute!):
##D ma <- bayesmeta(y=sj[,"log.or"], sigma=sj[,"log.or.se"], label=sj[,"id.sj"],
##D                 tau.prior=function(t){dhalfcauchy(t,scale=1)})
##D 
##D # show heterogeneity's posterior density:
##D plot(ma, which=4, main="Sidik/Jonkman example", prior=TRUE)
##D 
##D # show some numbers (mode, median and mean):
##D abline(v=ma$summary[c("mode","median","mean"),"tau"], col="blue")
##D 
##D # compare with Sidik and Jonkman's estimates:
##D sj.estimates <- sqrt(c("MM"  = 0.429,   # method of moments estimator
##D                        "VC"  = 0.841,   # variance component type estimator
##D                        "ML"  = 0.562,   # maximum likelihood estimator
##D                        "REML"= 0.598,   # restricted maximum likelihood estimator
##D                        "EB"  = 0.703,   # empirical Bayes estimator
##D                        "MV"  = 0.818,   # model error variance estimator
##D                        "MVvc"= 0.747))  # a variation of the MV estimator
##D abline(v=sj.estimates, col="red", lty="dashed")
##D 
##D # generate forest plot:
##D fp <- forestplot(ma, exponentiate=TRUE, plot=FALSE)
##D # add extra columns for ID and year:
##D labtext <- fp$labeltext
##D labtext[1,1] <- "ID 2"
##D labtext[31:32,1] <- ""
##D labtext <- cbind(c("ID 1", SidikJonkman2007[,"id"], "mean","prediction"),
##D                  labtext[,1],
##D                  c("year", as.character(SidikJonkman2007[,"year"]), "", ""),
##D                  labtext[,-1])
##D # plot:
##D forestplot(ma, labeltext=labtext, exponentiate=TRUE, 
##D            xlog=TRUE, xlab="odds ratio", xticks=c(0.1,1,10))
##D 
## End(Not run)



