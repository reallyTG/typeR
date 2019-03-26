library(tikzDevice)


### Name: tikz
### Title: TikZ Graphics Device
### Aliases: tikz
### Keywords: device

### ** Examples


## Not run: 
##D 
##D ## Example 1 ###################################
##D #Set up temporary work directory
##D td <- tempdir()
##D tf <- file.path(td,'example1.tex')
##D oldwd <- getwd()
##D setwd(td)
##D 
##D # Minimal plot
##D tikz(tf,standAlone=TRUE)
##D   plot(1)
##D dev.off()
##D 
##D # View the output
##D tools::texi2dvi(tf,pdf=T)
##D system(paste(getOption('pdfviewer'),file.path(td,'example1.pdf')))
##D setwd(oldwd)
##D ################################################
##D 
##D ## Example 2 ###################################
##D #Set up temporary work directory
##D td <- tempdir()
##D tf <- file.path(td,'example2.tex')
##D oldwd <- getwd()
##D setwd(td)
##D 
##D #LaTeX math symbol names
##D syms <-c('alpha','theta','tau','beta','vartheta','pi','upsilon',
##D          'gamma','gamma','varpi','phi','delta','kappa','rho',
##D          'varphi','epsilon','lambda','varrho','chi','varepsilon',
##D          'mu','sigma','psi','zeta','nu','varsigma','omega','eta',
##D          'xi','Gamma','Lambda','Sigma','Psi','Delta','Xi','Upsilon',
##D          'Omega','Theta','Pi','Phi')
##D x <- rnorm(length(syms))
##D y <- rnorm(length(syms))
##D 
##D tikz(tf,standAlone=TRUE)
##D   plot(-2:2, -2:2, type = "n", axes=F,
##D       xlab='', ylab='', main='TikZ Device Math Example')
##D     text(x,y,paste('\\\\Large$\\\\',syms,'$',sep=''))
##D dev.off()
##D 
##D #View the output
##D tools::texi2dvi(tf,pdf=TRUE)
##D system(paste(getOption('pdfviewer'),file.path(td,'example2.pdf')))
##D setwd(oldwd)
##D ################################################
##D 
##D ## Example 3 ###################################
##D #Set up temporary work directory
##D td <- tempdir()
##D tf <- file.path(td,'example3.tex')
##D oldwd <- getwd()
##D setwd(td)
##D 
##D tikz(tf,standAlone=TRUE)
##D   plot(-2:2, -2:2, type = "n", axes=F, xlab='', ylab='', main='Random Circles')
##D     points(rnorm(50), rnorm(50), pch=21,
##D       bg=rainbow(50,alpha=.5), cex=10)
##D dev.off()
##D 
##D #View the output
##D tools::texi2dvi(tf,pdf=TRUE)
##D system(paste(getOption('pdfviewer'),file.path(td,'example3.pdf')))
##D setwd(oldwd)
##D ################################################
## End(Not run)




