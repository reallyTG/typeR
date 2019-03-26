library(Lahman)


### Name: CollegePlaying
### Title: CollegePlaying table
### Aliases: CollegePlaying
### Keywords: datasets

### ** Examples

data(CollegePlaying)
head(CollegePlaying)

## Q: What are the top universities for producing MLB players?
SPcount <- table(CollegePlaying$schoolID)
SPcount[SPcount>50]

library("lattice")
dotplot(SPcount[SPcount>50])
dotplot(sort(SPcount[SPcount>50]))

## Q: How many schools are represented in this dataset?
length(table(CollegePlaying$schoolID))

# Histogram of the number of players from each school who played in MLB:
with(CollegePlaying, 
     hist(table(schoolID), xlab = "Number of players",
                           main = ""))



