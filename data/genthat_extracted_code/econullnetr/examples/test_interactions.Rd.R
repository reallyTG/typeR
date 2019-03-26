library(econullnetr)


### Name: test_interactions
### Title: Compare observed interaction strengths in a network to those
###   estimated from a null model
### Aliases: test_interactions

### ** Examples

null.1 <- generate_null_net(WelshStreams[, 2:18], WelshStreams.prey[, 2:17],
                            sims = 10, c.samples = WelshStreams[, 1],
                            r.samples = WelshStreams.prey[, 1])
test_interactions(null.1, 0.95)




