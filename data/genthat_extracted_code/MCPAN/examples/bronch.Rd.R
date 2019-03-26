library(MCPAN)


### Name: bronch
### Title: Rodent bronchial carcinoma data
### Aliases: bronch
### Keywords: datasets

### ** Examples

data(bronch)
# raw tumour counts:

table(bronch[c("group","Y")])

# groupwise times of death:

boxplot(time ~ group, data=bronch, horizontal=TRUE)

# Using poly3estf, we can produce the
# summary statistics as presented in 
# Table 6.6, page 239, of Piegorsch and Bailer (1997):

poly3estf(status=bronch$Y, time=bronch$time, f=bronch$group)





