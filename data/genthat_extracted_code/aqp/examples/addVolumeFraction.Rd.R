library(aqp)


### Name: addVolumeFraction
### Title: Symbolize Volume Fraction on a Soil Profile Collection Plot
### Aliases: addVolumeFraction
### Keywords: ~kwd1

### ** Examples

# sample data
data(loafercreek, package='soilDB')

# subset first 10 profiles 
s <- loafercreek[1:10, ]

# replace 0% frags with NA
s$total_frags_pct[which(s$total_frags_pct == 0)] <- NA

# plot in random order, note that annotations follow
par(mar=c(0, 0, 3, 0))
plot(s, color='total_frags_pct', plot.order=sample(1:length(s)))
addVolumeFraction(s, 'total_frags_pct', pch=1)

par(mar=c(0, 0, 0, 0))
plot(s, max.depth=100, name='total_frags_pct', cex.name=1, axis.line.offset=-4.25)
addVolumeFraction(s, 'total_frags_pct', pch=1)



