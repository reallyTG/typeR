library(bamdit)


### Name: plotw
### Title: Plot for the conflict of evidence parameters w1 and w2
### Aliases: plotw
### Keywords: file

### ** Examples


## execute analysis
## Not run: 
##D 
##D data(ep)
##D m.ep <- metadiag(ep[,1:4],
##D            re = "sm",
##D            re.model = "SeSp",
##D            split.w = TRUE,
##D            df.estimate = TRUE)
##D 
##D plotw(m.ep)
##D 
##D # Relationship between conflict and study design
##D plotw(m.ep, group = ep.gr)
##D 
## End(Not run)




