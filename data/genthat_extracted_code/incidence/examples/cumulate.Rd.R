library(incidence)


### Name: cumulate
### Title: Compute cumulative 'incidence'
### Aliases: cumulate cumulate.default cumulate.incidence

### ** Examples

dat <- as.integer(c(0,1,2,2,3,5,7))
group <- factor(c(1, 2, 3, 3, 3, 3, 1))
i <- incidence(dat, groups = group)
i
plot(i)

i_cum <- cumulate(i)
i_cum
plot(i_cum)




