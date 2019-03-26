library(cgam)


### Name: mental
### Title: Alachua County Study of Mental Impairment
### Aliases: mental
### Keywords: datasets

### ** Examples

	# proportional odds model example 
	data(mental)
	
	# model the relationship between the latent variable and life event index as increasing
	# socio-economic status is included as a binary covariate 
	fit.incr <- cgam(mental ~ incr(life) + ses, data = mental, family = Ord)

	# check the estimated probabilities P(mental = k), k = 1, 2, 3, 4
	probs.incr <- fitted(fit.incr)
	head(probs.incr)



