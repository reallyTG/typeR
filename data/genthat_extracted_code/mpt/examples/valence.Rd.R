library(mpt)


### Name: valence
### Title: World Valence and Source Memory for Vertical Position
### Aliases: valence
### Keywords: datasets

### ** Examples

data(valence)

## Fit source-monitoring model to subsets of data
spec <- mptspec("SourceMon", .restr=list(d1=d, d2=d))
names(spec$prob) <- colnames(valence$y)

mpt(spec, valence[valence$condition == "congruent" &
                  valence$gender == "female", "y"])
mpt(spec, valence[valence$condition == "incongruent" &
                  valence$gender == "female", "y"])

## Test hypotheses across subsets
val.agg <- aggregate(y ~ gender + condition, valence, sum)
y <- as.vector(t(val.agg[, -(1:2)]))

spec <- mptspec("SourceMon", .replicates=4,
                .restr=list(d11=d1, d21=d1, d12=d2, d22=d2,
                            d13=d3, d23=d3, d14=d4, d24=d4))
mpt1 <- mpt(spec, y)
mpt2 <- mpt(update(spec, .restr=list(d1=d.f, d3=d.f, d2=d.m, d4=d.m)), y)
anova(mpt2, mpt1)  # better discrimination in congruent trials

## Plot parameter estimates
mat <- matrix(coef(mpt1), 5)
rownames(mat) <- c("D1", "d",  "g",  "b",  "D2")
mat <- mat[c("D1", "D2", "d", "b", "g"),]
matplot(mat, type="b", axes=FALSE, ylab="MPT model parameter estimate",
        main="Word valence and source monitoring", ylim=0:1, pch=1:4)
axis(1, 1:5, rownames(mat)); axis(2)
legend("bottomleft", c("female, congruent", "male, congruent",
       "female, incongruent", "male, incongruent"), pch=1:4, bty="n")



