library(epiDisplay)


### Name: lookup
### Title: Recode several values of a variable
### Aliases: lookup
### Keywords: database

### ** Examples

a       <- c( 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, NA)
tx      <- rbind(c(1,2),c(2,1),c(3,4),c(4,NA),c(NA,3)) 

# Swapping values of 1 and 2; rotating 3, 4 and NA
new.a  <- lookup(a, tx)
data.frame(a, new.a)
tableA <- table(a, new.a, exclude=NULL) 
# All non-diagonal cells which are non-zero are the recoded cells. 
print(tableA, zero=".")

## Character look-up table
b <- c(rep(letters[1:4],2), ".", NA)
tx1 <- cbind(c(letters[1:5], ".", NA), c("Disease A","Disease B","Disease C", 
	"Disease D","Disease E", NA, "Unknown"))
DiseaseName <- lookup(b, tx1)
data.frame(b, DiseaseName)



