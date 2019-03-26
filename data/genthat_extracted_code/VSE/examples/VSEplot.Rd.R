library(VSE)


### Name: VSEplot
### Title: VSEplot
### Aliases: VSEplot
### Keywords: VSE, boxplot

### ** Examples

#Load pre-saved object "bca.vse" as an example VSE output
load(file.path(system.file("extdata", "vse_output.Rda", package="VSE")))
VSEplot(bca.vse, las=2,pch=20, cex=1, cex.main=0.6, padj=0.05)



