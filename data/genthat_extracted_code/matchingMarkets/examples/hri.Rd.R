library(matchingMarkets)


### Name: hri
### Title: All stable matchings in the hospital/residents problem with
###   incomplete lists
### Aliases: hri
### Keywords: algorithms

### ** Examples

## Not run: 
##D ## -----------------------
##D ## --- Marriage problem 
##D 
##D ## 7 men, 6 women, random preferences:
##D  hri(nStudents=7, nColleges=6, seed=4)
##D 
##D ## 3 men, 2 women, given preferences:
##D  s.prefs <- matrix(c(1,2, 1,2, 1,2), 2,3)
##D  c.prefs <- matrix(c(1,2,3, 1,2,3), 3,2)
##D  hri(s.prefs=s.prefs, c.prefs=c.prefs)
##D 
##D ## 3 men, 2 women, given preferences:
##D  s.prefs <- matrix(c("x","y", "x","y", "x","y"), 2,3)
##D  colnames(s.prefs) <- c("A","B","C")
##D  c.prefs <- matrix(c("A","B","C", "A","B","C"), 3,2)
##D  colnames(c.prefs) <- c("x","y")
##D  hri(s.prefs=s.prefs, c.prefs=c.prefs)
##D 
##D ## --------------------------------
##D ## --- College admission problem 
##D 
##D ## 7 students, 2 colleges with 3 slots each, random preferences:
##D  hri(nStudents=7, nSlots=c(3,3), seed=21)
##D 
##D ## 7 students, 2 colleges with 3 slots each, given preferences:
##D  s.prefs <- matrix(c(1,2, 1,2, 1,NA, 1,2, 1,2, 1,2, 1,2), 2,7)
##D  c.prefs <- matrix(c(1,2,3,4,5,6,7, 1,2,3,4,5,NA,NA), 7,2)
##D  hri(s.prefs=s.prefs, c.prefs=c.prefs, nSlots=c(3,3))
##D  
##D ## 7 students, 2 colleges with 3 slots each, given preferences:
##D  s.prefs <- matrix(c("x","y", "x","y", "x",NA, "x","y", 
##D                      "x","y", "x","y", "x","y"), 2,7)
##D  colnames(s.prefs) <- c("A","B","C","D","E","F","G")
##D  c.prefs <- matrix(c("A","B","C","D","E","F","G", 
##D                      "A","B","C","D","E",NA,NA), 7,2)
##D  colnames(c.prefs) <- c("x","y")
##D  hri(s.prefs=s.prefs, c.prefs=c.prefs, nSlots=c(3,3))
##D  
##D ## 7 students, 3 colleges with 3 slots each, incomplete preferences:
##D  hri(nStudents=7, nSlots=c(3,3,3), seed=21, s.range=c(1,3))
##D  
##D  s.prefs <- matrix(c('S1', 'S2', NA,
##D                      'S3', 'S1', NA,
##D                      'S1', NA, NA,
##D                       NA, NA,NA,
##D                      'S2', 'S1', 'S5'),
##D                    nrow = 3, ncol = 5)
##D  # Note that we explicitly allow for the existence of entries refering to colleges
##D  # that do not exist. A warning is generated and the entry is ignored.
##D  colnames(s.prefs) <- c('A', 'B', 'C', 'D', 'E')
##D  c.prefs <- matrix(c('B', 'C','D', 'A',
##D                      'C', 'D', NA, NA, 
##D                      'D', 'B', 'A', 'E'),
##D                    nrow = 4, ncol = 3)
##D  colnames(c.prefs) <- c('S1', 'S2', 'S3')
##D  hri(s.prefs=s.prefs, c.prefs=c.prefs, nSlots=c(3,3,3), check_consistency = TRUE)
##D ## --------------------
##D ## --- Summary plots
##D 
##D ## 200 students, 200 colleges with 1 slot each
##D  res <- hri(nStudents=200, nColleges=200, seed=12)
##D  plot(res)
##D  plot(res, energy=TRUE)
## End(Not run)



