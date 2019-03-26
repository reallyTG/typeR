library(FuzzyStatTra)


### Name: checking
### Title: Checking correct data format (as array)
### Aliases: checking
### Keywords: attribute

### ** Examples

# Example 1:
F=SimulCASE1(10)
R=TransfTra(F)
c=checking(R)
c

# Example 2:
R=array(c(1:10),dim=c(2,1,2))
c=checking(R)
c

# Example 3:
R=array(c(1:10),dim=c(2,3,2))
c=checking(R)
c

# Example 4:
R=array(c(1,2,3,4,5,6,1,2,4,5,6,7),dim=c(2,3,2))
c=checking(R)
c

# Example 5:
R=array(c(0,0,1,2,3,4,5,0,1,0,0,1,7,8,9,19,30,3),dim=c(3,3,2))
c=checking(R)
c

# Example 6:
R=array(c(0,0.5,1,2,3,4,5,0,1,0,0.5,1,7,8,7,19,30,3),dim=c(3,3,2))
c=checking(R)
c

# Example 7:
R=array(c(0,0.5,1,2,3,4,5,0,1,0,0.5,1,7,8,9,19,30,3),dim=c(3,3,2))
c=checking(R)
c

# Example 8:
R=array(c(0,0.5,1,2,3,4,6,5,4,0,0.5,1,7,8,9,19,10,2),dim=c(3,3,2))
c=checking(R)
c



