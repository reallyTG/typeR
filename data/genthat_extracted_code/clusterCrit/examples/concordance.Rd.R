library(clusterCrit)


### Name: concordance
### Title: Compute Concordance Matrix
### Aliases: concordance

### ** Examples

# Generate two artificial partitions
part1<-sample(1:3,150,replace=TRUE)
part2<-sample(1:5,150,replace=TRUE)

# Compute the table of concordances and discordances
concordance(part1,part2)



