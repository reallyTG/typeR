library(RCurl)


### Name: scp
### Title: Retrieve contents of a file from a remote host via SCP (Secure
###   Copy)
### Aliases: scp
### Keywords: IO programming

### ** Examples

## Not run: 
##D    x = scp("eeyore.ucdavis.edu", "/home/duncan/OmegaWeb/index.html",
##D            "My.SCP.Passphrase", binary = FALSE)
##D    x = scp("eeyore.ucdavis.edu", "/home/duncan/OmegaWeb/RCurl/xmlParse.bz2",
##D            "My.SCP.Passphrase")
##D    if(require(Rcompression))
##D       o = bunzip2(x)
## End(Not run)



