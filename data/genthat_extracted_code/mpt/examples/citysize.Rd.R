library(mpt)


### Name: citysize
### Title: City-Size Paired-Comparison Task and Instruction Type
### Aliases: citysize
### Keywords: datasets

### ** Examples

data(citysize)

## Fit r-model separately for each instruction type
mpt(mptspec("rmodel"), unname(citysize[citysize$instr == "none",  "y"]))
mpt(mptspec("rmodel"), unname(citysize[citysize$instr == "recog", "y"]))

## Test instruction effect on r parameter
city.agg <- aggregate(y ~ instr, citysize, sum)
y <- as.vector(t(city.agg[, -1]))

m1 <- mpt(mptspec("rmodel", .replicates=2), y)
m2 <- mpt(update(m1$spec, .restr=list(r2=r1)), y)
anova(m2, m1)  # more use of RH with recognition instruction

## Plot parameter estimates
dotchart(coef(m1)[c(4, 1:3)], xlim=0:1, labels=c("a", "b", "g", "r"),
         xlab="Parameter estimate (r-model)",
         main="Recognition heuristic use by instruction type")
points(coef(m1)[c(8, 5:7)], 1:4, pch=16)
legend(0, 1, c("none", "recognition"), pch=c(1, 16),
       title="Instruction", bty="n")



