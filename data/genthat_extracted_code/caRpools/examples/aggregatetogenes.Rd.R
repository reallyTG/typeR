library(caRpools)


### Name: aggregatetogenes
### Title: Aggregates pooled CRISPR screen sgRNA data to gene data
### Aliases: aggregatetogenes
### Keywords: CRISPR

### ** Examples

data(caRpools)

CONTROL1.g=aggregatetogenes(data.frame = CONTROL1, agg.function=sum,
                            extractpattern = expression("^(.+?)(_.+)"))



