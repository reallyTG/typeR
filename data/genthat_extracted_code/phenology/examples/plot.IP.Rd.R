library(phenology)


### Name: plot.IP
### Title: Plot a result of Internesting Period fit or data.
### Aliases: plot.IP

### ** Examples

## Not run: 
##D library(phenology)
##D # Example
##D data <- c(0, 47, 15, 6, 5, 4, 2, 5, 57, 203, 205, 103, 35, 24, 12, 10, 
##D   13, 49, 86, 107, 111, 73, 47, 30, 19, 17, 33, 48, 77, 83, 65, 
##D   37, 27, 23, 24, 22, 41, 42, 44, 33, 39, 24, 18, 18, 22, 22, 19, 
##D   24, 28, 17, 18, 19, 17, 4, 12, 9, 6, 11, 7, 11, 12, 5, 4, 6, 
##D   11, 5, 6, 7, 3, 2, 1, 3, 2, 1, 2, 0, 0, 3, 1, 0, 2, 0, 0, 1)
##D   class(data) <- "IP"
##D   plot(data)
##D   
##D ######### Fit parametric ECF using Maximum-Likelihood
##D 
##D par <- c(meanIP = 9.9959691992722917, 
##D          sdIP = 0.10066664270893474, 
##D          minIP = 7.5684588178888754, 
##D          pAbort = 2.2510012544630911, 
##D          meanAbort = 2.8969185085603386, 
##D          sdAbort = 0.92688983853803242, 
##D          pCapture = -1.0393803705929086, 
##D          meanECF = 3.9551519427394255, 
##D          sdECF = 0.31657679943365019)
##D 
##D fML <- IPFit(x=par, 
##D fixed.parameters=c(N=1000000),
##D data=data, 
##D verbose=FALSE, 
##D model="ML")
##D 
##D # Plot the fitted ECF
##D plot(fML, result="ECF")
##D 
##D # Plot the Internesting Period distribution
##D plot(fML, result="IP")
##D 
##D # Plot the distribution of days between tentatives
##D plot(fML, result="Abort")
##D plot(fML, result="Abort", xlim=c(0, 10))
##D 
##D # Plot the data
##D plot(fML, result="data")
##D 
##D # Plot the data and the model
##D plot(fML, result="data&model")
##D 
##D # Plot the cumulative proportion of ECF according to date of observation
##D plot(fML, result="reverseECF")
##D plot(fML_NP_Delta, result="reverseECF", col=grey.colors(128))
##D 
##D ######### Fit using Metropolis-Hastings
##D # ECF.1 = 1 is fixed
##D par <- c(ECF.2 = 0.044151921569961131, 
##D          ECF.3 = 2.0020778325280748, 
##D          ECF.4 = 2.6128345101617083, 
##D          ECF.5 = 2.6450582416622375, 
##D          ECF.6 = 2.715198206774927, 
##D          ECF.7 = 2.0288031327239904, 
##D          ECF.8 = 1.0028041546528881, 
##D          ECF.9 = 0.70977432157689235, 
##D          ECF.10 = 0.086052204035003091, 
##D          ECF.11 = 0.011400419961702518, 
##D          ECF.12 = 0.001825219438794076, 
##D          ECF.13 = 0.00029398731859899116, 
##D          ECF.14 = 0.002784886479846703, 
##D          meanIP = 9.9887100433529721, 
##D          sdIP = 0.10580250625108811, 
##D          minIP = 6.5159124624132048, 
##D          pAbort = 2.5702251748938956, 
##D          meanAbort = 2.2721679285648841, 
##D          sdAbort = 0.52006431730489933, 
##D          pCapture = 0.079471782729506113)
##D          
##D df <- data.frame(Density=rep("dunif", length(par)), 
##D Prior1=c(rep(0, 13), 8, 0.001, 0, -8, 0, 0.001, -8), 
##D Prior2=c(rep(10, 13), 12, 1, 10, 8, 2, 1, 8), 
##D SDProp=unname(c(ECF.2 = 6.366805760909012e-05, 
##D                 ECF.3 = 6.366805760909012e-05, 
##D                 ECF.4 = 6.366805760909012e-05, 
##D                 ECF.5 = 6.366805760909012e-05, 
##D                 ECF.6 = 6.366805760909012e-05, 
##D                 ECF.7 = 6.366805760909012e-05, 
##D                 ECF.8 = 6.366805760909012e-05, 
##D                 ECF.9 = 6.366805760909012e-05, 
##D                 ECF.10 = 6.366805760909012e-05, 
##D                 ECF.11 = 6.366805760909012e-05, 
##D                 ECF.12 = 6.366805760909012e-05, 
##D                 ECF.13 = 6.366805760909012e-05, 
##D                 ECF.14 = 6.366805760909012e-05, 
##D                 meanIP = 6.366805760909012e-05, 
##D                 sdIP = 6.366805760909012e-05, 
##D                 minIP = 6.366805760909012e-05, 
##D                 pAbort = 6.366805760909012e-05, 
##D                 meanAbort = 6.366805760909012e-05, 
##D                 sdAbort = 6.366805760909012e-05, 
##D                 pCapture = 6.366805760909012e-05)),               
##D Min=c(rep(0, 13), 8, 0.001, 0, -8, 0, 0.001, -8), 
##D Max=c(rep(10, 13), 12, 1, 10, 8, 2, 1, 8),
##D Init=par, stringsAsFactors = FALSE)
##D rownames(df)<- names(par)
##D 
##D fMH <- IPFit(parametersMH=df, 
##D fixed.parameters=c(N=10000),
##D data=data, 
##D verbose=FALSE, 
##D n.iter = 10000,
##D n.chains = 1, n.adapt = 100, thin = 1, trace = TRUE,
##D adaptive = TRUE, 
##D model="MH")
##D 
##D # Plot the fitted ECF
##D plot(fMH, result="ECF")
##D 
##D # Plot the posteriors and priors
##D plot(fMH$MH, parameters="meanIP", xlim=c(6, 14))
##D 
##D plot(x=1:length(fMH$MH$resultLnL[[1]]), y=fMH$MH$resultLnL[[1]], 
##D type="l", xlab="Iterations", ylab="Ln L", bty="n", las=1)
## End(Not run)



