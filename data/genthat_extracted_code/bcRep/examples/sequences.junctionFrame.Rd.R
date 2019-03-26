library(bcRep)


### Name: sequences.junctionFrame
### Title: Summary of junction frames of sequences
### Aliases: sequences.junctionFrame

### ** Examples

data(summarytab)
junctionfr<-sequences.junctionFrame(data = summarytab$JUNCTION_frame)
barplot(as.numeric(junctionfr),xlab="",xlim=c(0,2),legend.text = colnames(junctionfr),
     col=c("orange","darkblue","gray"),xaxt="n",main="Junction frame usage",ylab="proportion")



