library(MetProc)


### Name: plot_metric
### Title: Plot Distribution of Metabolite Quality Metrics for Each Split
###   of Data
### Aliases: plot_metric

### ** Examples

library(MetProc)

#Read in metabolomics data
metdata <- read.met(system.file("extdata/sampledata.csv", package="MetProc"),
headrow=3, metidcol=1, fvalue=8, sep=",", ppkey="PPP", ippkey="BPP")

#Plot distributions of the two metrics for each group
plot_metric(metdata,ppkey='PPP',sidkey='X',numsplit=5,mincut=0.02,maxcut=0.95,
scut=0.5,cor_rates=c(.6,.65,.65,.65,.6),runlengths=c(NA,15,15,15,NA),
histcolors=c('red','yellow','green','blue','purple'))



