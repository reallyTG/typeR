library(bcRep)


### Name: sequences.functionality
### Title: Summary of functionality of sequences
### Aliases: sequences.functionality

### ** Examples

data(summarytab)
funct<-sequences.functionality(data = summarytab$Functionality)
barplot(as.numeric(funct),xlab="",xlim=c(0,2),legend.text = colnames(funct),
     col=c("orange","darkblue","gray"),xaxt="n",main="Functionality",ylab="proportion")



