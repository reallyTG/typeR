library(netdiffuseR)


### Name: mentor_matching
### Title: Optimal Leader/Mentor Matching
### Aliases: mentor_matching leader_matching plot.diffnet_mentor

### ** Examples

# A simple example ----------------------------------------------------------
set.seed(1231)
graph <- rgraph_ws(n=50, k = 4, p = .5)

# Looking for 3 mentors
ans <- mentor_matching(graph, n = 3)

head(ans)
table(ans$match) # We actually got 9 b/c of ties

# Visualizing the mentor network
plot(ans)




