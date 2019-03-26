library(alakazam)


### Name: rarefyDiversity
### Title: Generate a clonal diversity index curve
### Aliases: rarefyDiversity

### ** Examples

# Group by sample identifier
div <- rarefyDiversity(ExampleDb, "SAMPLE", step_q=1, max_q=10, nboot=100)
plotDiversityCurve(div, legend_title="Sample")
                   
# Grouping by isotype rather than sample identifier
div <- rarefyDiversity(ExampleDb, "ISOTYPE", min_n=40, step_q=1, max_q=10, 
                       nboot=100)
plotDiversityCurve(div, legend_title="Isotype")




