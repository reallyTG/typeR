library(MAd)


### Name: plotcon
### Title: Meta Regression Scatterplot
### Aliases: plotcon
### Keywords: aplot

### ** Examples

# SAMPLE DATA
MA2 <-read.table(textConnection("
id       es1       var1 n.1 n.2 mod1 mod2
1   1 0.5695938 0.04906967  26  30    a   20
2   2 0.4123667 0.04362541  28  34    b   30
3   3 0.4084333 0.04458363  34  28    a   25
4   4 0.5014756 0.04186354  37  29    b   35
5   5 0.5540745 0.04339382  31  32    b   40
6   1 0.5695938 0.04906967  26  30    a   20
7   2 0.4123667 0.04362541  28  34    b   30
8   3 0.4084333 0.04458363  34  28    a   25
9   4 0.5014756 0.04186354  37  29    b   35
10  5 0.5540745 0.04339382  31  32    b   40"))


# EXAMPLE
plotcon(es1, var1, mod2, data=MA2, method= "fixed", modname="NULL",title="NULL")



