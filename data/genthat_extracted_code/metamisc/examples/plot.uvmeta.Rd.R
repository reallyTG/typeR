library(metamisc)


### Name: plot.uvmeta
### Title: Forest Plots
### Aliases: plot.uvmeta
### Keywords: forest meta-analysis

### ** Examples

data(Roberts)

# Frequentist random-effects meta-analysis
fit <- with(Roberts, uvmeta(r=SDM, r.se=SE, labels=rownames(Roberts)))
plot(fit) 




