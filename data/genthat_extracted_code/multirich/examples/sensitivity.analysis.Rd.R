library(multirich)


### Name: sensitivity.analysis
### Title: Sensitivity Analysis
### Aliases: sensitivity.analysis

### ** Examples

# Example of a sensitivity analysis using simulated traits

# Set up example
#Adding 0.5 is to give even probabilities when rounding
n.recs = 10
tr1 = round(runif(n.recs,1 - 0.5, 10 +0.5),0) 
tr2 = round(runif(n.recs,1 - 0.5, 4 + 0.5),0)

# Set up row & col names
row.nams = sprintf("Record_%s", seq(1,n.recs))
col.nams = c("tr1","tr2")

#Create matrix
in.mat = matrix(c(tr1,tr2), ncol = 2, dimnames = list(row.nams, col.nams))

# Get break points
tr1.breaks = get.breaks(1,10)
tr2.breaks = get.breaks(1,4)
tr2.breaks = expand.breaks(tr2.breaks, 9)

breaks = list(tr1.breaks, tr2.breaks)

# Actually run sensitivity analysis
# Note that the plot & results will vary as this depends on random numbers
results = sensitivity.analysis(in.mat,"none", breaks, "none")




