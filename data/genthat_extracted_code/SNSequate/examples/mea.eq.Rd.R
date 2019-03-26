library(SNSequate)


### Name: mea.eq
### Title: The mean method of equating
### Aliases: mea.eq mea.eq.default
### Keywords: Traditional equating methods

### ** Examples

#Artificial data for two two 100 item tests forms and 5 individuals in each group
x1<-c(67,70,77,79,65,74)
y1<-c(77,75,73,89,68,80)

#Score means
mean(x1); mean(y1)

#An equivalent form y1 score of 72 on form x1
mea.eq(x1,y1,72)

#Equivalent form y1 score for the whole scale range
mea.eq(x1,y1,0:100)



