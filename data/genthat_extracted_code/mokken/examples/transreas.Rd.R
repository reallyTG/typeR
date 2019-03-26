library(mokken)


### Name: transreas
### Title: Transitive Reasoning
### Aliases: transreas
### Keywords: datasets

### ** Examples

# Construction of Table 3.1 in Sijtsma and Molenaar (2002, p. 33)
data(transreas)
grades <- transreas[,1]
item.scores <- transreas[,-1]
Total.group <- round(apply(item.scores,2,mean),2)
for (i in 2:6) assign(paste("Grade.",i,sep=""),
   round(apply(item.scores[grades==i,],2,mean),2))
Task <- c(9,12,10,11,4,5,2,7,3,1,8,6)
Property <- attributes(transreas)$property
Format <- attributes(transreas)$format
Objects <- attributes(transreas)$objects
Measures <- attributes(transreas)$measures
Table.3.1 <- data.frame(Task,Property,Format,Objects,Measures,
   Total.group,Grade.2,Grade.3,Grade.4,Grade.5,Grade.6)
Table.3.1



