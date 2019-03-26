library(respirometry)


### Name: flush_water
### Title: Find percent of water exchanged after a flush
### Aliases: flush_water

### ** Examples

# What proportion of a 90 L respirometer is exchanged after 20 minutes of flow at 2 LPM?
flush_water(vol = 90, flow_rate = 2, duration = 20)

# Would it be worth it to extend the flush another five minutes? How much would that
# improve the exchange?
flush_water(vol = 90, flow_rate = 2, duration = 20, plot = TRUE)
# Another five minutes would increase exchange by nearly 10%.
# Perhaps that's worth the extra time...

# Visualize flushing
vol = 150
flow_rate = seq(0, 10, by = 0.5)
duration = 0:60
perc_fresh = outer(flow_rate, duration, function(flow_rate, duration){
	flush_water(vol = vol, flow_rate = flow_rate, duration = duration)
})
persp(flow_rate, duration, perc_fresh, xlab = 'Flow rate (LPM)', ylab = 'Duration (min)',
zlab = '% exchange', theta = 45, phi = 15, expand = 0.5, ticktype = 'detailed', nticks = 10)




