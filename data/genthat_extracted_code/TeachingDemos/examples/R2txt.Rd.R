library(TeachingDemos)


### Name: txtStart
### Title: Save a transcript of commands and/or output to a text file.
### Aliases: txtStart txtStop txtComment txtSkip etxtStart etxtStop
###   etxtComment etxtSkip etxtPlot wdtxtStart wdtxtStop wdtxtComment
###   wdtxtSkip wdtxtPlot mdtxtStart mdtxtStop mdtxtComment mdtxtSkip
###   mdtxtPlot
### Keywords: character IO utilities

### ** Examples

## Not run: 
##D etxtStart()
##D etxtComment('This is todays transcript')
##D date()
##D x <- rnorm(25)
##D summary(x)
##D stem(x)
##D etxtSkip(?hist)
##D hist(x)
##D etxtPlot()
##D Sys.Date()
##D Sys.time()
##D my.file <- etxtStop()
##D 
##D # assumes enscript and ps2pdf are on your path
##D system(paste('enscript -e -B -p transcript.ps ', my.file) )
##D system('ps2pdf transcript.ps')
##D 
##D # if the above commands used mdtxt instead of etxt and the pandoc
##D # program is installed and on your path (and dependent programs) then use:
##D system(paste('pandoc -o transcript.docx ', my.file))
## End(Not run)



