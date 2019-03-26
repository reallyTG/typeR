library(kaps)


### Name: count.mindat
### Title: Caculate the minimum sample size when the number of subgroups is
###   given
### Aliases: count.mindat
### Keywords: kaps

### ** Examples

	data(toy)
	count.mindat(Surv(time,staus) ~ meta, data = toy, part =5)
	count.mindat(Surv(time,staus) ~ meta, data = toy, part =10)
	count.mindat(Surv(time,staus) ~ meta, data = toy)



