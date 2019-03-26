library(PeakSegJoint)


### Name: PeakSegJointFaster
### Title: PeakSegJointFaster
### Aliases: PeakSegJointFaster

### ** Examples


library(PeakSegJoint)
data(H3K36me3.TDH.other.chunk1, envir=environment())
some.counts <- subset(
  H3K36me3.TDH.other.chunk1$counts,
  43000000 < chromEnd &
  chromStart < 43200000)
some.counts$sample.group <- some.counts$cell.type

fit <- PeakSegJointFaster(some.counts, 2:7)

if(interactive() && require(ggplot2)){

  both <- with(fit, rbind(
    data.frame(model="sample", sample.modelSelection),
  data.frame(model="group", group.modelSelection)))
  ggplot()+
    ggtitle("model selection functions")+
    scale_size_manual(values=c(sample=2, group=1))+
    geom_segment(aes(min.log.lambda, complexity,
                     color=model, size=model,
                     xend=max.log.lambda, yend=complexity),
                 data=both)+
    xlab("log(penalty)")+
    ylab("model complexity (samples or groups with a common peak)")

}




