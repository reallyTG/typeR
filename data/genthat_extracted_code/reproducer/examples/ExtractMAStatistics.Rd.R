library(reproducer)


### Name: ExtractMAStatistics
### Title: ExtractMAStatistics
### Aliases: ExtractMAStatistics

### ** Examples

ExpData=reproducer::KitchenhamMadeyskiBrereton.ExpData
#Extract the experiment basic statics
S1data=subset(ExpData,ExpData=="S1")
#Use the descriptive data to construct effect size
S1EffectSizes = reproducer::PrepareForMetaAnalysisGtoR(S1data$Mc,
S1data$Mt,S1data$SDc,S1data$SDt,S1data$Nc,S1data$Nt)
# Do a random effect meta-analysis of the transformed r_pbs effect size
S1MA = metafor::rma(S1EffectSizes$zr, S1EffectSizes$vi)
# Extract summary statistics from meta-analysis results and transform back to Hg scale
S1MAStats=reproducer::ExtractMAStatistics(S1MA, sum(S1data$Nc),sum(S1data$Nt), TRUE, "d", 4)
#    mean   pvalue    UB     LB QE  QEp
#1 0.6658 0.002069 1.122 0.2384  4 0.41



