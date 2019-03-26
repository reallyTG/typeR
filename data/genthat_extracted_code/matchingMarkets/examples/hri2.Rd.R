library(matchingMarkets)


### Name: hri2
### Title: Resident-optimal matching in the hospital/residents problem with
###   couples
### Aliases: hri2
### Keywords: algorithms, matching

### ** Examples

## Not run: 
##D ## Example with given preferences
##D (s.prefs <- matrix(c(4,2,3,5, 2,1,3,NA, 1,2,3,4), 4,3))
##D (c.prefs <- matrix(rep(1:5,5), 5,5))
##D (co.prefs <- matrix(c(rep(4,3), rep(5,3), 3,3,NA, 3,NA,3), 3,4))
##D res <- hri2(s.prefs=s.prefs, c.prefs=c.prefs, co.prefs=co.prefs, nSlots=rep(1,5))
##D res$matchings
##D # summary(res)
##D 
##D ## Example with random preferences
##D nStudents <- 50
##D nColleges <- 30
##D nCouples <- 4
##D nSlots <- sample(1:nStudents, nColleges)
##D res <- hri2(nStudents=nStudents, nColleges=nColleges, nCouples=nCouples, nSlots=nSlots)
##D res$matchings
##D # summary(res)
##D 
##D ## Example with characters in the preferences matrices
##D s.prefs <- matrix(c("Micro1", NA, NA,
##D                     "Micro2", "Micro1", "Macro",
##D                     "Macro",NA ,NA), 
##D                     ncol = 3)
##D colnames(s.prefs) <- c('Lea', 'Mia', 'Kai')
##D c.prefs <- matrix(c("Niklas", "Kai", "Mia", "Anna",
##D                     "Lea", "Kai", "Anna",NA,
##D                     "Kai", "Mia", "Lea",NA), 
##D                     ncol = 3)
##D colnames(c.prefs) <- c('Micro1', 'Micro2', 'Macro')
##D col1 <- c(rep("Niklas",4),rep("Anna",5))
##D col2 <- c(rep("Jan",4),rep("Lisa",5))
##D col3 <- c("Micro1","Macro","Micro1",NA,"Macro",
##D           NA,"Micro2","Micro2","Macro")
##D col4 <- c("Micro2","Micro1",NA,"Macro","Macro",
##D           "Micro1","Micro2","Macro",NA)
##D co.prefs <- matrix(c(col1,col2,col3,col4), ncol = 4)
##D res <- hri2(s.prefs=s.prefs, c.prefs=c.prefs, co.prefs=co.prefs, 
##D             nSlots=c(2,1,1))                     
##D res$matching
##D 
##D ## Example if students are allowed to apply and be accepted by two courses   
##D col12 <- c(rep(c(rep("Niklas",4),rep("Anna",2)),2))
##D col3 <- c("Micro1","Macro","Micro1","Macro","Macro","Macro")
##D col4 <- c("Micro2","Micro1",NA,NA,"Micro1","Micro2")
##D co.prefs <- matrix(c(col12,col3,col4), ncol = 4)
##D res <- hri2(s.prefs=s.prefs, c.prefs=c.prefs, co.prefs=co.prefs, 
##D             nSlots=c(2,1,1))                     
##D res$matching
## End(Not run)                                                                                



