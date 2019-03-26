library(epiDisplay)


### Name: sampsize
### Title: Sample size calculation
### Aliases: n.for.survey n.for.2means n.for.cluster.2means n.for.2p
###   n.for.cluster.2p n.for.equi.2p n.for.noninferior.2p n.for.lqas
### Keywords: math

### ** Examples

# In a standard survey to determine the coverage of immunization needed using 
# a cluster sampling technique on a population of approximately 500000, and
# an estimated prevalence of 70 percent, design effect is assumed to be 2.

n.for.survey( p = .8, delta = .1, popsize = 500000, deff =2) # 123 needed

# To see the effect of prevalence on delta and sample size
n.for.survey( p = c(.5, .6, .7, .8, .9, .95, .99)) 

# Testing the efficacy of measles vaccine in a case control study . 
# The coverage in the non-diseased population is estimated at 80 percent. 
# That in the diseased is 60 percent.

n.for.2p(p1=.8, p2=.6) # n1=n2=91 needed

# A randomized controlled trial testing cure rate of a disease of
# 90 percent by new drugs  and 80 percent by the old one.

n.for.2p(p1=.9, p2=.8) # 219 subjects needed in each arm.

# To see the effect of p1 on sample size
n.for.2p(p1=seq(1,9,.5)/10, p2=.5) # A table output

# The same randomized trial to check whether the new treatment is 5 percent
# different from the standard treatment assuming both arms has a common
# cure rate of 85 percent would be

n.for.equi.2p(p=.85, sig.diff=0.05)  # 801 each.

# If inferior arm is not allow to be lower than -0.05 (5 percent less effective)
n.for.noninferior.2p(p=.85, sig.inferior=0.05)  # 631 each.

# A cluster randomized controlled trial to test whether training of village
# volunteers would result in reduction of prevalence of a disease from 50 percent
# in control villages to 30 percent in the study village with a cluster size
# varies from 250 to 500 eligible subjects per village (mean of 350) and the
# intraclass correlation is assumed to be 0.15

n.for.cluster.2p(p1=.5, p2=.3, mean.cluster.size = 350, max.cluster.size = 500, 
min.cluster.size = 250, icc = 0.15)



# A quality assurance to check whether the coding of ICD-10 is faulty 
# by no more than 2 percent.The minimum sample is required. 
# Thus any faulty coding in the sample is not acceptable.

n.for.lqas(p0 = .02, q=0, exact = TRUE) # 148 non-faulty checks is required 
# to support the assurance process.

n.for.lqas(p0 = (1:10)/100, q=0, exact = FALSE) 



