library(aqp)


### Name: plot_distance_graph
### Title: Between Individual Distance Plot
### Aliases: plot_distance_graph
### Keywords: hplot

### ** Examples

data(sp2)

d <- profile_compare(sp2, vars=c('prop','field_ph','hue','value'), 
max_d=100, k=0.01, sample_interval=5)

par(mfcol=c(3,1), mar=c(2.5,4.5,1,1))
plot_distance_graph(d, idx=1:6)
plot_distance_graph(d, idx=7:12)
plot_distance_graph(d, idx=12:18)





