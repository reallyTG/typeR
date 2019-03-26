library(RJSplot)


### Name: manhattan_rjs
### Title: Create an interactive manhattan plot
### Aliases: manhattan_rjs

### ** Examples

## No test: 
## Create an interactive Manhattan plot in the folder "ManhattanPlot" of your local machine
## Live examples on http://rjsplot.net

# Create test data
chr <- character()
pos <- numeric()

for(i in 1:nrow(GRCh38)){
  chr <- c(chr,as.character(rep(GRCh38[i,"chr"],100)))
  pos <- c(pos,sample(GRCh38[i,"start"]:GRCh38[i,"end"],100))
}

value <- round(rexp(length(pos)),2)

# Create a manhattan plot
data <- data.frame(paste0("ProbeSet_",seq_along(pos)),chr,pos,value)
manhattan_rjs(data, GRCh38, 0, 1, 0, TRUE, "log2Ratio")
## End(No test)



