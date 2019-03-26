library(tmod)


### Name: modmetabo
### Title: Modules for metabolic profiling
### Aliases: modmetabo tbmprof

### ** Examples

data(modmetabo)  # module definitions
data(tbmprof)    # example data set
ids <- rownames(tbmprof)
tb  <- factor(gsub("\\..*", "", ids))

## use Wilcoxon test to calculate significant differences
wcx <- apply(tbmprof, 2, function(x) wilcox.test(x ~ tb)$p.value)
wcx <- sort(wcx)
tmodCERNOtest(names(wcx), mset=modmetabo)



