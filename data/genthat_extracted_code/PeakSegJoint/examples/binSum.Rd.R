library(PeakSegJoint)


### Name: binSum
### Title: binSum
### Aliases: binSum

### ** Examples

## bins of size 3bp.
## -1-   -3-   -5-
##    -2-   -4-
## 123456789012345 base index.
## --2---
##       --1-
##           --0-------
## Coverage profile.
profile <- data.frame(chromStart=as.integer(c(0, 6, 10)),
                      chromEnd=as.integer(c(6, 10, 10000)),
                      count=as.integer(c(2, 1, 0)))
library(PeakSegJoint)
bins <- binSum(profile,
               bin.chromStart=0L,
               bin.size=3L,
               n.bins=2000L)
library(ggplot2)
bases <- data.frame(position=1:15, base="N")
ggplot()+
  ylab("")+
  geom_text(aes(position, 0, label=base),
            data=bases)+
  geom_step(aes(chromStart+0.5, count, color=what),
            data=data.frame(profile, what="profile"),
            size=2)+
  geom_step(aes(chromStart+0.5, count, color=what),
            data=data.frame(bins, what="bin total"))+
  geom_step(aes(chromStart+0.5, mean, color=what),
            data=data.frame(bins, what="bin mean"))+
  coord_cartesian(xlim=c(0, max(bases$position)))



