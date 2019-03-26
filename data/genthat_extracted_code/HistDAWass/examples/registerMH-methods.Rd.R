library(HistDAWass)


### Name: registerMH
### Title: Method registerMH
### Aliases: registerMH registerMH,MatH-method
### Keywords: distribution

### ** Examples

#initialize three distributionH objects mydist1 and mydist2 
 mydist1=new("distributionH",c(1,2,3),c(0, 0.4, 1))
 mydist2=new("distributionH",c(7,8,10,15),c(0, 0.2, 0.7, 1))
 mydist3=new("distributionH",c(9,11,20),c(0, 0.8, 1))
# create a MatH object

 MyMAT=new("MatH",nrows=1,ncols=3,ListOfDist=c(mydist1,mydist2,mydist3), 1,3)
# register the two distributions
  MATregistered=registerMH(MyMAT)
# OUTPUT the structure of MATregstered
str(MATregistered)
#   Formal class 'MatH' [package "HistDAWass"] with 1 slots
#   .. @ M:List of 3
#   .. ..$ :Formal class 'distributionH' [package "HistDAWass"] with 4 slots
#   .. .. .. ..@ x: num [1:6] 1 1.5 2 2.5 2.67 ...
#   .. .. .. ..@ p: num [1:6] 0 0.2 0.4 0.7 0.8 1
#   ...
#   .. ..$ :Formal class 'distributionH' [package "HistDAWass"] with 4 slots
#   .. .. .. ..@ x: num [1:6] 7 8 8.8 10 11.7 ...
#   .. .. .. ..@ p: num [1:6] 0 0.2 0.4 0.7 0.8 1
#   ...
#   .. ..$ :Formal class 'distributionH' [package "HistDAWass"] with 4 slots
#   .. .. .. ..@ x: num [1:6] 9 9.5 10 10.8 11 ...
#   .. .. .. ..@ p: num [1:6] 0 0.2 0.4 0.7 0.8 1
#   ...
#   .. ..- attr(*, "dim")= int [1:2] 1 3
#   .. ..- attr(*, "dimnames")=List of 2
#   .. .. ..$ : chr "I1"
#   .. .. ..$ : chr [1:3] "X1" "X2" "X3"



