library(wildpoker)


### Name: wpgraphs
### Title: Wild Poker Graphs for Best Hand Analysis
### Aliases: wpgraphs

### ** Examples

# These examples show the gstat output option.  For the graphs of these examples,
# see \bold{value} section, above.
#
# example of normal wpgraphs use.
wpgraphs(ngame = "Follow the Queen", players = 6, wcnum = 1, stats = TRUE)

# example of using wpstats to generate a nonstandard combination
# note that if a gstat object is provided (by wpstats), the ngame, players, wcnum aren't used 
wpgraphs(wpstats("High Chicago", 4, "Dr Pepper", numdeal = 10, seed = 100), stats = TRUE)




