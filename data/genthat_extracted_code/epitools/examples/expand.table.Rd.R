library(epitools)


### Name: expand.table
### Title: Expand contingency table into individual-level data set
### Aliases: expand.table
### Keywords: manip

### ** Examples

##Creating array using 'array' function and expanding it
tab <- array(1:8, c(2, 2, 2))
dimnames(tab) <- list(c("No","Yes"), c("No","Yes"), c("No","Yes"))
names(dimnames(tab)) <- c("Exposure", "Disease", "Confounder")
tab
df <- expand.table(tab)
df

##Creating array using 'table' function and expanding it
tab2 <- table(Exposure = df$Exp, Disease = df$Dis, Confounder = df$Conf)
expand.table(tab2)

##Expanding ftable object
ftab2 <- ftable(tab2)
ftab2
expand.table(as.table(ftab2))

##Convert Titanic data into individual-level data frame
data(Titanic)
expand.table(Titanic)[1:20,]

##Convert Titanic data into group-level data frame
as.data.frame(Titanic)




