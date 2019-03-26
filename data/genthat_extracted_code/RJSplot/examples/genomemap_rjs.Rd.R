library(RJSplot)


### Name: genomemap_rjs
### Title: Create an interative genome map.
### Aliases: genomemap_rjs

### ** Examples

## No test: 
## Create an interactive Genome map in the folder "GenomeMap" of your local machine
## Live examples on http://rjsplot.net

# Create test data
chr <- character()
pos <- numeric()

for(i in 1:nrow(GRCh38)){
  chr <- c(chr,as.character(rep(GRCh38[i,"chr"],100)))
  pos <- c(pos,sample(GRCh38[i,"start"]:GRCh38[i,"end"],100))
}

value <- round(rexp(length(pos)),2)

# Create a genome map
track <- data.frame(chr,pos,pos+1,NA,value)
genomemap_rjs(GRCh38.bands, track)
## End(No test)



