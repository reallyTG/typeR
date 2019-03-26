library(esc)


### Name: esc_mean_gain
### Title: Compute effect size from Mean Gain Scores and Standard
###   Deviations
### Aliases: esc_mean_gain

### ** Examples

# effect size of mean gain scores, with available pre-post values
esc_mean_gain(pre1mean = 13.07, pre1sd = 11.95, post1mean = 6.1,
              post1sd = 8.33, grp1n = 78, pre2mean = 10.77, pre2sd = 10.73,
              post2mean = 8.83, post2sd = 9.67, grp2n = 83)

# same as above, but with assumed correlation of .5
# Note that effect size is the same, but variance differs
esc_mean_gain(pre1mean = 13.07, pre1sd = 11.95, post1mean = 6.1, grp1r = .5,
              post1sd = 8.33, grp1n = 78, pre2mean = 10.77, pre2sd = 10.73,
              post2mean = 8.83, post2sd = 9.67, grp2n = 83, grp2r = .5)

# effect size based on gain scores for mean and sd. note that the
# pre-post correlations must be given
esc_mean_gain(gain1mean = 1.5, gain1sd = 1, grp1n = 40, grp1r = .5,
              gain2mean = .7, gain2sd = .8, grp2n = 50, grp2r = .5)




