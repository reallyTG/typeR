library(RcmdrMisc)


### Name: lineplot
### Title: Plot a one or more lines.
### Aliases: lineplot
### Keywords: hplot

### ** Examples

    if (require("car")){
    data(Bfox)
    Bfox$time <- as.numeric(rownames(Bfox))
    with(Bfox, lineplot(time, menwage, womwage))
}



