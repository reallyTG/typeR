library(TRAMPR)


### Name: classify
### Title: Value Matching for Data Frames
### Aliases: classify
### Keywords: utilities manip logic internal

### ** Examples

table <- data.frame(a=letters[1:3], b=rep(1:2, each=3))
x <- cbind(table[sample(nrow(table), 20, TRUE),], x=runif(20))

classify(x, table)
all.equal(table[classify(x, table),], x[names(table)])

## Select only a few cases from a TRAMPsamples data object,
## corresponding with 4 enzyme/primer combinations.
data(demo.samples)
d <- demo.samples$data
use <- expand.grid(primer=c("ITS1F", "ITS4"),
                   enzyme=c("HpyCH4IV", "BsuRI"))
classify(d, use)
d[!is.na(classify(d, use)),]



