library(LMest)


### Name: long2wide
### Title: From data in the long format to data in the wide format
### Aliases: long2wide

### ** Examples

# Example based on criminal data
# load criminal data
data(data_criminal_sim)
# consider only the first 1000 records to shorten time
out = long2wide(data_criminal_sim[1:1000,],"id","time","sex",
	c("y1","y2","y3","y4","y5","y6","y7","y8","y9","y10"),aggr=TRUE,full=999)	



