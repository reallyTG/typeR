library(ecotoxicology)


### Name: IsMonotonicallyIncreasing
### Title: Determine if a series is monotonically increasing
### Aliases: IsMonotonicallyIncreasing

### ** Examples

#Data from the example on page 8:
#Hamilton, m.a., R.c. Russo, and r.v. Thurston, 1977.
#Trimmed spearman-karber method for estimating median
#Lethal concentrations in toxicity bioassays.
#Environ. Sci. Technol. 11(7): 714-719;
#Correction 12(4):417 (1978).
concentration<-c(1.1,2.3,4.5,8.8,17.1)
exposed<-c(10,10,9,10,10)
mortality<-c(1,5,4,2,7)
p<-mortality/exposed
x<-log(concentration)
IsMonotonicallyIncreasing(p)



