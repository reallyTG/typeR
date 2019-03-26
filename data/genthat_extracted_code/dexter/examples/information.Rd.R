library(dexter)


### Name: information
### Title: Functions of theta
### Aliases: information expected_score r_score

### ** Examples


db = start_new_project(verbAggrRules,':memory:')
add_booklet(db,verbAggrData, "agg")
p = fit_enorm(db)

# plot information function for single item

ifun = information(p, "S1DoScold")

plot(ifun,from=-4,to=4)

# compare test information function to the population ability distribution

ifun = information(p, booklet="agg")

pv = plausible_values(db,p)

op = par(no.readonly=TRUE)
par(mar = c(5,4,2,4))

plot(ifun,from=-4,to=4, xlab='theta', ylab='test information')

par(new=TRUE)

plot(density(pv$PV1), col='green', axes=FALSE,xlab=NA, ylab=NA,main=NA)
axis(side=4)
mtext(side = 4, line = 2.5, 'population density (green)')

par(op)
close_project(db)




