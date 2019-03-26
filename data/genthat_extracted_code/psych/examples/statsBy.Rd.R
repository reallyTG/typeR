library(psych)


### Name: statsBy
### Title: Find statistics (including correlations) within and between
###   groups for basic multilevel analyses
### Aliases: statsBy statsBy.boot statsBy.boot.summary faBy
### Keywords: multivariate models

### ** Examples

#Taken from Pedhazur, 1997
pedhazur <- structure(list(Group = c(1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 
2L), X = c(5L, 2L, 4L, 6L, 3L, 8L, 5L, 7L, 9L, 6L), Y = 1:10), .Names = c("Group", 
"X", "Y"), class = "data.frame", row.names = c(NA, -10L))
pedhazur
ped.stats <- statsBy(pedhazur,"Group")
ped.stats


#Now do this for the sat.act data set
sat.stats <- statsBy(sat.act,c("education","gender"),cor=TRUE)   #group by two grouping variables
print(sat.stats,short=FALSE)
lowerMat(sat.stats$pbg)  #get the probability values

#show means by groups
round(sat.stats$mean)

#Do separate factor analyses for each group
#faBy(sat.stats,1)






