library(rel)


### Name: gac
### Title: Gwet's AC1 and AC2
### Aliases: gac
### Keywords: univar

### ** Examples

#Sample data: 200 subjects and one 5-category item.
data <- cbind(sample(1:5,200, replace=TRUE),sample(1:5,200, replace=TRUE))

#A numeric kat*kat matrix with custom weights 
cw <- diag(ncol(matrix(0,5,5)))
cw[cw!=diag(cw)] <- runif(20,0,1)

#AC1
gac(data=data, kat=5, weight="unweighted", conf.level = 0.95)

#AC2 with custom weights
gac(data=data, kat=5, weight=cw, conf.level = 0.95)



