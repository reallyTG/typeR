library(R2MLwiN)


### Name: runMLwiN
### Title: Calls MLwiN from R.
### Aliases: runMLwiN

### ** Examples


## The R2MLwiN package includes scripts to replicate all the analyses in
## Rasbash et al (2012) A User's Guide to MLwiN Version 2.26 and
## Browne, W.J. (2012) MCMC estimation in MLwiN Version 2.26.
## The MLwiN manuals are available online, see:
## http://www.bristol.ac.uk/cmm/software/mlwin/download/manuals.html

## Not run: 
##D library(R2MLwiN)
##D # NOTE: if MLwiN not saved in location R2MLwiN defaults to, specify path via:
##D # options(MLwiN_path = 'path/to/MLwiN vX.XX/')
##D # If using R2MLwiN via WINE, the path may look like this:
##D # options(MLwiN_path = '/home/USERNAME/.wine/drive_c/Program Files (x86)/MLwiN vX.XX/')
##D 
##D ## For a list of demo titles
##D demo(package = 'R2MLwiN')
##D 
##D ## Take MCMCGuide03 as an example
##D ## To view file
##D file.show(system.file('demo', 'MCMCGuide03.R', package='R2MLwiN'))
##D 
##D ## To run the demo
##D demo(MCMCGuide03)
## End(Not run)




