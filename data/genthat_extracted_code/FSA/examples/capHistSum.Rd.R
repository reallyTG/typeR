library(FSA)


### Name: capHistSum
### Title: Summarize capture histories in individual fish format.
### Aliases: capHistSum plot.CapHist is.CapHist
### Keywords: manip

### ** Examples

# data.frame with IDs in the first column
head(PikeNYPartial1)

# Three ways to ignore first column of ID numbers
( ch1 <- capHistSum(PikeNYPartial1,cols2use=-1) )
( ch1 <- capHistSum(PikeNYPartial1,cols2ignore=1) )
( ch1 <- capHistSum(PikeNYPartial1,cols2ignore="id") )

# diagnostic plots
plot(ch1)
plot(ch1,what="f")
plot(ch1,what="u")

# An examle with only two sample events (for demonstration only)
( ch2 <- capHistSum(PikeNYPartial1,cols2use=-c(1,4:5)) )
( ch2 <- capHistSum(PikeNYPartial1,cols2use=2:3) )
( ch2 <- capHistSum(PikeNYPartial1,cols2ignore=c(1,4:5)) )




