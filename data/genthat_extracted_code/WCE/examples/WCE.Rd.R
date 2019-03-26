library(WCE)


### Name: WCE
### Title: Fit weighted cumulative exposure models
### Aliases: WCE

### ** Examples

wce <- WCE(drugdata, "Cox", 1, 90, constrained = "R", id = "Id", event = "Event", 
		   start = "Start", stop = "Stop", expos = "dose", covariates = c("age", "sex"))

## Not run: 
##D # Confidence intervals for HR, as well as pointwise confidence bands 
##D # for the estimated weight function can be obtained via bootstrap.
##D 
##D # Set the number of bootstrap resamples 
##D #(set to 5 for demonstration purposes, should be higher)
##D B <- 5
##D 
##D # Obtain the list of ID for sampling
##D ID <- unique(drugdata$Id)
##D 
##D # Prepare vectors to extract estimated weight function and HR 
##D # for the best-fitting model for each bootstrap resample
##D boot.WCE <- matrix(NA, ncol = 90, nrow=B)
##D boot.HR <- rep(NA, B)
##D 
##D # Sample IDs with replacement
##D for (i in 1:B){
##D    ID.resamp <- sort(sample(ID, replace=T)) 
##D    datab <- drugdata[drugdata$Id ##D 
##D 
##D    # deal with duplicated Id and assign them new Id
##D    step <- 1
##D    repeat {
##D       ID.resamp <- ID.resamp[duplicated(ID.resamp)==TRUE] # select duplicated Id in ID.resamp 
##D       if (length(ID.resamp)==0) break # stop when no more duplicated Id to deal with   
##D       subset.dup <- drugdata[drugdata$Id ##D 
##D       # assign new Id to duplicates
##D       subset.dup$Id <- subset.dup$Id + step * 10^ceiling(log10(max(drugdata$Id))) 
##D          # 10^ceiling(log10(max(drugdata$Id)) is the power of 10 
##D          # above the maximum Id from original data
##D       datab <- rbind(datab, subset.dup)
##D       step <- step+1
##D    }
##D 
##D    mod <- WCE(data = datab, analysis = "Cox", nknots = 1:3, cutoff = 90, 
##D       constrained = "R", aic = FALSE, MatchedSet = NULL, 
##D       id = "Id", event = "Event", start = "Start", stop = "Stop", 
##D       expos = "dose", covariates = c("sex", "age"))
##D 
##D    # return best WCE estimates and corresponding HR
##D    best <- which.min(mod$info.criterion)
##D    boot.WCE[i,] <- mod$WCEmat[best,]
##D    boot.HR[i] <- HR.WCE(mod, rep(1, 90), rep(0, 90))
##D }
##D 
##D # Summarize bootstrap results using percentile method
##D apply(boot.WCE, 2, quantile, p = c(0.05, 0.95))
##D quantile(boot.HR, p = c(0.05, 0.95))
## End(Not run)



