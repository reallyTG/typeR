library(GENEAread)


### Name: plot.stft
### Title: plot stft
### Aliases: plot.stft

### ** Examples

 ## Not run: 
##D # Real data
##D  binfile  = system.file("binfile/TESTfile.bin", package = "GENEAread")[1]
##D 
##D #Read in the entire file, calibrated
##D  procfile<-read.bin(binfile)
##D  #Create stft object
##D  obj = stft(procfile, type = "svm", quiet = TRUE)
##D  #Look at it
##D  print(obj)
##D 
##D  plot(obj, cex = 5)
##D  plot(obj, showmax = FALSE, cex = 5) #suppress principals
##D 
##D  #pval plot
##D  plot(obj, mode = "pval", cex = 5)
##D  #disable reassigned stft
##D  plot(obj, mode = "pval", reassign = FALSE)
##D  #median smoothing
##D  plot(obj, mode = "pval", reassign = FALSE, median = TRUE)
##D  #log scale frequency, no top bar
##D  dev.new(); plot(obj, mode = "pval", reassign = FALSE, topthresh = Inf, log = "y")
## End(Not run)



