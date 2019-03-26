library(GENEAread)


### Name: stft
### Title: Computes Short Time Fourier Transforms
### Aliases: stft

### ** Examples

## Not run: 
##D #Some artificial data
##D time = 1:5000
##D #sum of two sine curves at 0.3 Hz and 0.05 Hz
##D f1 = 0.3; f2 = 0.05
##D sin1 = sin(time * f1 * 2*pi)
##D sin2 = sin(time * f2 * 2*pi)
##D #add a bit of noise
##D signal = sin1 + sin2 + 1*rnorm(5000)
##D #non-reassigned
##D stft(signal, plot = TRUE, reassign = FALSE, win = 100)
##D #reassigned
##D stft(signal, plot = TRUE, reassign = TRUE, win = 100)
##D 
##D #add a third component: varying frequency.
##D stft(signal + sin(cumsum(seq(f2, f1, length = 5000))*2*pi),
##D                  plot = TRUE, reassign = TRUE, win = 100)
##D 
##D # Real data
##D binfile  = system.file("binfile/TESTfile.bin", package = "GENEAread")[1]
##D 
##D # Read in the entire file, calibrated
##D procfile<-read.bin(binfile)
##D # Default is mv
##D stft(procfile, plot.it = TRUE)
##D # Try sum?
##D stft(procfile, plot.it = TRUE, type = "sum", reassign = FALSE)
##D 
##D # Just look at the last 50% of the data
##D stft(procfile, start = 0.5, plot.it = TRUE)
##D 
##D # not reassigned, svm
##D stft(procfile, type = "svm", reassign = FALSE, plot.it = TRUE)
##D # a narrower 5 second window means better time resolution
##D stft(procfile, type = "svm", reassign = FALSE, plot.it = TRUE, win = 5)
##D # choose increments so as not to overlap
##D stft(procfile, type = "svm", reassign = FALSE, plot.it = TRUE, win = 5, inc = 5)
##D # uniform windows
##D stft(procfile, type = "svm", reassign = FALSE, plot.it = TRUE, wtype = "uniform.window")
##D # Svm, reassigned, quietly
##D obj = stft(procfile, type = "svm", quiet = TRUE)
##D plot(obj, cex = 3, showmax = FALSE, mode = "pval")
##D 
##D #example code
##D plot(stft(subs(mag, 0.94,0.96), win = 1024, plot = F, coef = 512), zlog = T, log="y")
##D plot(stft(subs(mag, 0.7,8), win = 1024, plot = F, coef = 512), zlog = T, log="y")
##D plot(stft(subs(mag, 0.0001,0.005), win = 1024, plot = F, coef = 512), zlog = T)
##D plot(stft(subs(mag, 0.7,0.8), win = 1024, plot = F), zlog = T, log = "y")
##D 
##D plot(stft(rep(1, 1000) +
##D       c(sin(1:500/ 10 * 2*pi), rep(0, 500)) +
##D       c(rep(0, 300),sin(1:500/ 20 * 2*pi), rep(0, 200)),
##D      freq = 1, plot.it = F), log="x")
##D 
##D stft(sin(1:1000 / (1 +sqrt(1000:1)) * 2 * pi), freq = 1)
##D stft(rep(1, 1000) + sin(1:1000/ 10 * 2*pi), freq = 1)
## End(Not run)



