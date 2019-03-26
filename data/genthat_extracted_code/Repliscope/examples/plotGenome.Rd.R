library(Repliscope)


### Name: plotGenome
### Title: plotGenome: plot replication profile.
### Aliases: plotGenome
### Keywords: bioinformatics genomics ggplot2 replication

### ** Examples

plotGenome(sortSeq,geom="geom_ribbon",guide=guide,region="chrIX:250000-439885",
    lines=sacCer3[["cen"]],circles=sacCer3[["ori"]])
# plot data as polygon for the specified region of chromosome 9

plotGenome(syncSeq[["data"]],geom="geom_segment",guide=syncSeq[["guide"]],
    region="chrVII:0-1090944",genome=sacCer3[["genome"]],lines=sacCer3[["cen"]],
    circles=sacCer3[["ori"]],colourLines="black")

plotGenome(MFA,region='chr1:0-2848000')
# plot marker frequency analysis for H.volcanii isolate DS2



