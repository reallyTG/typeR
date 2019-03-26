library(plotrix)


### Name: getIntersectList
### Title: Enter a set intersection list
### Aliases: getIntersectList
### Keywords: misc

### ** Examples

 # this example is from a haplotype mapping problem submitted by Mao Jianfeng
 ## Not run: 
##D  hapIntList<-
##D   getIntersectList(3,xnames=c("hap.Pd","hap.Pt","hap.Py"))
##D  # enter the data as follows:
##D  # Number of elements in hap.Pd - 1: 27.586
##D  # Number of elements in hap.Pt - 1: 20.689
##D  # Number of elements in hap.Py - 1: 31.035
##D  # Number of elements in hap.Pd-hap.Pt - 1: 10.345
##D  # Number of elements in hap.Pd-hap.Py - 1: 10.345
##D  # Number of elements in hap.Pt-hap.Py - 1: 0
##D  # Number of elements in hap.Pd-hap.Pt-hap.Py - 1: 0
##D  # Total number of elements - 1: 100
##D  
## End(Not run)
 hapIntList<-structure(list(structure(c(27.586, 20.689, 31.035),
  .Names = c("hap.Pd","hap.Pt","hap.Py")),
  structure(c(10.345, 10.345, 0),
  .Names = c("hap.Pd-hap.Pt","hap.Pd-hap.Py","hap.Pt-hap.Py")),
  structure(0, .Names = "hap.Pd-hap.Pt-hap.Py"),100),
  class = "intersectList")
 intersectDiagram(hapIntList)



