library(detrendr)


### Name: pillar-stats
### Title: Get the sums/means/medians/variances of pillars of an
###   ijtiff_img-style array.
### Aliases: pillar-stats sum_pillars mean_pillars median_pillars
###   var_pillars

### ** Examples

aaa <- array(seq_len(2 ^ 4), dim = rep(2, 4))  # a 2-channel, 2-frame array
sum_pillars(aaa)
mean_pillars(aaa)
median_pillars(aaa)
var_pillars(aaa)




