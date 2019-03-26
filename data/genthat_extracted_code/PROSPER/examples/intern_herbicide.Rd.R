library(PROSPER)


### Name: intern_herbicide
### Title: Surviving the Herbicide
### Aliases: intern_herbicide

### ** Examples

#How many of 1000 weeds of a genotype with resistance value 5.5 survive a herbicide application 
#with full dose? 'It is assumed that weeds reseaving less than 20 % of the full dose survive
#independently of their resistant value.
intern_herbicide(resist=5.5, n_samples=1000, put=0.04, rate=100, sdrate=0.4, thresh=20)



