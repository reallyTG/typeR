library(MOTE)


### Name: v.chi.sq
### Title: V for Chi-Square
### Aliases: v.chi.sq
### Keywords: chi-square effect size,

### ** Examples


#The following example is derived from the "chisq_data" dataset, included
#in the MOTE library.

#Individuals were polled about their number of friends (low, medium, high)
#and their number of kids (1, 2, 3+) to determine if there was a
#relationship between friend groups and number of children, as we
#might expect that those with more children may have less time for
#friendship maintaining activities.

chisq.test(chisq_data$kids, chisq_data$friends)

v.chi.sq(x2 = 2.0496, n = 60, r = 3, c = 3, a = .05)

#Please note, if you see a warning, that implies the lower effect should
#be zero, as noted.



