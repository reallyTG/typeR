library(bcRep)


### Name: sequences.mutation
### Title: Basic statistics on mutations of sequences
### Aliases: sequences.mutation

### ** Examples

data(mutationtab)
data(summarytab)
V.mutation<-sequences.mutation(mutationtab = mutationtab, summarytab = summarytab, 
     sequence = "V", junctionFr = TRUE, rsRatio=TRUE)
CDR1.mutation<-sequences.mutation(mutationtab = mutationtab, sequence = "CDR1",
     functionality=TRUE)
par(mar=c(18,5,5,3))
barplot(as.numeric(CDR1.mutation$Functionality[,1]),
     names=rownames(CDR1.mutation$Functionality),
     ylab="proportion",main="Mutation vs. Functionality",las=3)



