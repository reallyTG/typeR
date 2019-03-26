library(DescTools)


### Name: StuartTauC
### Title: Stuart Tau C
### Aliases: StuartTauC
### Keywords: multivar nonparametric

### ** Examples

# example in:
# http://support.sas.com/documentation/cdl/en/statugfreq/63124/PDF/default/statugfreq.pdf
# pp. S. 1821

tab <- as.table(rbind(c(26,26,23,18,9),c(6,7,9,14,23)))

StuartTauC(tab, conf.level=0.95)



