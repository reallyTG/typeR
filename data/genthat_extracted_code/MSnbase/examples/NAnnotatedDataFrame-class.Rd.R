library(MSnbase)


### Name: NAnnotatedDataFrame-class
### Title: Class Containing Measured Variables and Their Meta-Data
###   Description for Multiplexed Experiments.
### Aliases: NAnnotatedDataFrame-class NAnnotatedDataFrame
###   class:NAnnotatedDataFrame multiplex,NAnnotatedDataFrame-method
###   multiLabels,NAnnotatedDataFrame-method dim,NAnnotatedDataFrame-method
###   show,NAnnotatedDataFrame-method multiplex multiLabels
### Keywords: classes

### ** Examples

df <- data.frame(x=1:3,
                 y=LETTERS[1:3],
                 row.names=paste("Sample",1:3,sep=""))
metaData <-
  data.frame(labelDescription=c(
               "Numbers",
               "Factor levels"))
mplx <- c("M1","M2")
new("NAnnotatedDataFrame",
    data=df,
    varMetadata=metaData,
    multiplex=length(mplx),
    multiLabels=mplx)



