library(fwdmsa)


### Name: fwdmsa-package
### Title: Robust Mokken Scale Analysis by Means of the Forward Search
###   Algorithm for Outlier Detection
### Aliases: fwdmsa-package fwdmsa
### Keywords: package

### ** Examples


## Not run: 
##D ## Analyses of Zijlstra et al. (2010).
##D ## First Forward Search Analysis
##D    library(fwdmsa)
##D    data(acs.cont)
##D 
##D  # Determining n1 = 292
##D  # Takes approximately 40 minutes
##D    fs1.1.n1 <- fs.MSA.n1(acs.cont, B=100)
##D    n1 <- fs1.1.n1$n1 
##D 
##D  # Figure 2: Plot of number unique subsamples
##D    plot(fs1.1.n1)
##D 
##D  # Running the forward search
##D    fs1.1 <- fs.MSA(acs.cont)
##D 
##D  # Figure 3: Plot of objective function
##D    plot(fs1.1, type="objective", observations=1:618, col="gray70", n0=TRUE, n1=fs.res.cont.n1$n1, xlim=c(0,650))
##D    plot(fs1.1, type="objective", id.observation=619, col=1, lwd=2, lty=2, add=TRUE)
##D    plot(fs1.1, type="objective", observations=589:618, lwd=2, add=TRUE)
##D 
##D  # Figure 4: Gap plot
##D    plot(fs1.1, type="gap", ylim=c(-10,12), n0=TRUE, n1=292)
##D 
##D  # Figure 5: Follow-up plots
##D    plot(fs1.1, type="followup", step=543:548, reference.step=543, n0=TRUE, n1=292)
##D 
##D ## Remove influential observations from the data
##D    acs.sus <- acs.cont[-(589:618),]
##D  
##D  # Determining n1 = 296
##D    fs1.2.n1 <- fs.MSA.n1(acs.sus, B=100)
##D    n1 <- fs1.2.n1$n1 
##D 
##D  # Running the forward search
##D    fs1.2 <- fs.MSA(acs.sus)
##D 
##D  # Figure 6: Minexcl plot
##D    plot(fs1.2, type="minexcl", n0=TRUE, n1=296, n2=TRUE)
##D 
##D  # Figure 7: Plot of number of scales
##D    plot(fs1.2, type="num.scale", n0=TRUE, n1=296, n2=TRUE)
##D 
##D  # Figure 8: Item entry plot for the longest scale
##D    plot(fs1.2, type="scale", id.scale=1, n0=TRUE, n1=296, n2=TRUE)
##D 
##D ## Second Forward Search Analysis
##D  # Remove bad items from the data
##D    acs.min.core <- acs.cont[-(589:618),-c(3,7,8,11,13,16)]
##D  
##D  # Determining n1 = 302
##D    fs2.n1 <- fs.MSA.n1(acs.min.core, B=100)
##D    n1 <- fs2.1.n1$n1 
##D 
##D  # Running the forward search
##D    fs2 <- fs.MSA(acs.min.core)
##D 
##D  # Figure 9: Plot of restscore regression of item 1 for steps 302 and 589
##D    plot(fs2, type="restscore", step=302, items=1, lty=2, ylim=c(0,4), n0=TRUE, n1=302, n2=TRUE)
##D    plot(fs2, type="restscore", step=589, items=1, lty=1, add=TRUE)
##D 
##D  # Figure 10: Plot of estimated IRF of item 1
##D    plot(fs2, type="IRF", items=1, n0=TRUE, n1=302, n2=TRUE)
##D 
##D  # Figure 11: Plot of coefH
##D    plot(fs2, type="coefH", n0=TRUE, n1=302, n2=TRUE, ylim=c(.1,.8))
##D 
##D ## What if influential observations were not removed from the data
##D    acs.cont.core <- acs.cont[,-c(3,7,8,11,13,16)]
##D  # Determining n1 = 347
##D    fs3.n1 <- fs.MSA.n1(acs.cont.core, B=100)
##D    n1 <- fs3.n1$n1 
##D 
##D  # Running the forward search
##D    fs3 <- fs.MSA(acs.cont.core)
##D 
##D  # Figure 12a: Plot of estimated IRF of item 1 with influential observations
##D    plot(fs3, type="IRF", items=1, n0=TRUE, n1=347, n2=FALSE)
##D 
##D  # Figure 12b: Plot of coefH with influential observations
##D    plot(fs3, type="coefH", n0=TRUE, n1=347, n2=FALSE, ylim=c(.1,.8))
## End(Not run)                                                           



