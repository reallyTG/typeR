library(exactRankTests)


### Name: ASAT
### Title: Toxicological Study on Female Wistar Rats
### Aliases: ASAT
### Keywords: datasets

### ** Examples


data(ASAT)
# does not really look symmetric

plot(asat ~ group, data=ASAT)

# proof-of-safety based on ration of medians
pos <- wilcox.exact(I(log(asat)) ~ group, data = ASAT, alternative = "less", 
             conf.int=TRUE)

# one-sided confidence set. Safety cannot be concluded since the effect of
# the compound exceeds 20% of the control median
exp(pos$conf.int)



