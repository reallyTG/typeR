library(PLMIX)


### Name: make_complete
### Title: Completion of partial rankings/orderings
### Aliases: make_complete

### ** Examples


# Completion based on the top item frequencies
data(d_dublinwest)
head(d_dublinwest)
top_item_freq <- rank_summaries(data=d_dublinwest, format="ordering", mean_rank=FALSE, 
                                pc=FALSE)$marginals["Rank_1",]

d_dublinwest_compl <- make_complete(data=d_dublinwest, format="ordering", 
                                    probitems=top_item_freq)
head(d_dublinwest_compl$completedata)




