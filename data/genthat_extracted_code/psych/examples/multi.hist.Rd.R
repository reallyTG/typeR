library(psych)


### Name: multi.hist
### Title: Multiple histograms with density and normal fits on one page
### Aliases: multi.hist histo.density histBy
### Keywords: multivariate hplot

### ** Examples

multi.hist(sat.act) 
multi.hist(sat.act,bcol="red")
multi.hist(sat.act,dcol="blue")  #make both lines blue
multi.hist(sat.act,dcol= c("blue","red"),dlty=c("dotted", "solid")) 
multi.hist(sat.act,freq=TRUE)   #show the frequency plot
multi.hist(sat.act,nrow=2)
histBy(sat.act,"SATQ","gender")



