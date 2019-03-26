library(sidier)


### Name: single.network.module
### Title: Get modules and network given a threshold
### Aliases: single.network.module

### ** Examples

#generating distance matrix:
dis<-matrix(nrow=12,c(0.0000,0.5000,0.1875,0.5000,0.6250,0.5000,0.2500,0.6250,
0.3750,0.3750,0.3750,0.3750,0.5000,0.0000,0.7500,0.0000,0.6250,0.0000,0.8750,
0.6250,0.3750,0.3750,0.3750,0.3750,0.1875,0.7500,0.0000,0.7500,0.8750,0.7500,
0.2500,0.8750,0.6250,0.6250,0.6250,0.6250,0.5000,0.0000,0.7500,0.0000,0.6250,
0.0000,0.8750,0.6250,0.3750,0.3750,0.3750,0.3750,0.6250,0.6250,0.8750,0.6250,
0.0000,0.6250,0.5000,0.0000,0.2500,0.2500,0.2500,0.2500,0.5000,0.0000,0.7500,
0.0000,0.6250,0.0000,0.8750,0.6250,0.3750,0.3750,0.3750,0.3750,0.2500,0.8750,
0.2500,0.8750,0.5000,0.8750,0.0000,0.5000,0.5000,0.5000,0.5000,0.5000,0.6250,
0.6250,0.8750,0.6250,0.0000,0.6250,0.5000,0.0000,0.2500,0.2500,0.2500,0.2500,
0.3750,0.3750,0.6250,0.3750,0.2500,0.3750,0.5000,0.2500,0.0000,0.0000,0.0000,
0.0000,0.3750,0.3750,0.6250,0.3750,0.2500,0.3750,0.5000,0.2500,0.0000,0.0000,
0.0000,0.0000,0.3750,0.3750,0.6250,0.3750,0.2500,0.3750,0.5000,0.2500,0.0000,
0.0000,0.0000,0.0000,0.3750,0.3750,0.6250,0.3750,0.2500,0.3750,0.5000,0.2500,
0.0000,0.0000,0.0000,0.0000))
row.names(dis)<-c("Population1_sequence1","Population1_sequence2",
"Population1_sequence3","Population1_sequence4","Population2_sequence1",
"Population2_sequence2","Population2_sequence3","Population2_sequence4",
"Population3_sequence1","Population3_sequence2","Population3_sequence3",
"Population3_sequence4")
colnames(dis)<-row.names(dis)

#Representing distances equal or lower than 37% of the maximum distance:
single.network.module(dis=dis,threshold=0.37)
single.network.module(dis=dis,threshold=0.37,out="network")

# Compare these outputs with:
single.network(dis=dis,threshold=0.37,label=paste(substr(row.names(dis),11,11),
substr(row.names(dis),21,21),sep="-"))



