library(hydrostats)


### Name: Colwells
### Title: Colwells indices
### Aliases: Colwells

### ** Examples

data(Cooper)
Cooper<-ts.format(Cooper)

Colwells(Cooper, s=5)
Colwells(Cooper, boundaries="equal", s=11)
Colwells(Cooper, boundaries="log_class_size", s=11)
Colwells(Cooper, boundaries="weighted_log_class_size", s=11)

Colwells(Cooper, boundaries="Gan", from=1,by=1, s=4)
Colwells(Cooper, boundaries="Gan", from=0.25,by=0.25, s=9)

Colwells(Cooper, boundaries="Gan", from=0.25,by=0.25, s=9, indices.only=TRUE)


require(plyr)
data(Acheron)
Acheron<-ts.format(Acheron)
flow.ts<-rbind(data.frame(River="Acheron", Acheron), data.frame(River="Cooper", Cooper))

ddply(flow.ts, .(River), function(x)
Colwells(x, boundaries="weighted_log_class_size", s=11, indices.only=TRUE))



