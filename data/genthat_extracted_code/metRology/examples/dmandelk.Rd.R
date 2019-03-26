library(metRology)


### Name: Mandel-k
### Title: Mandel's k statistic.
### Aliases: dmandelk pmandelk qmandelk rmandelk
### Keywords: distribution

### ** Examples

	#Generate the 95% and 99% quantiles for comparison with tables in 
	#ISO 5725:1996 Part 2:
	
	round(qmandelk(0.95, g=3:30, n=3), 2) #95% upper tail

	round(qmandelk(0.99, g=3:30, n=3), 2) #99% upper tail
	



