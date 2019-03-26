library(santaR)


### Name: get_grouping
### Title: Generate a matrix of group membership for all individuals
### Aliases: get_grouping

### ** Examples

## 3 subjets in 2 groups
ind   <- c('ind_1','ind_1','ind_1','ind_2','ind_2','ind_3')
group <- c('g1','g1','g1','g2','g2','g1')
get_grouping(ind, group)
#     ind group
# 1 ind_1    g1
# 2 ind_2    g2
# 3 ind_3    g1

## 8 subjects in 2 groups
ind   <- acuteInflammation$meta$ind
group <- acuteInflammation$meta$group
get_grouping(ind, group)
#    ind   group
# 1 ind_1 Group1
# 2 ind_2 Group2
# 3 ind_3 Group1
# 4 ind_4 Group2
# 5 ind_5 Group1
# 6 ind_6 Group2
# 7 ind_7 Group1
# 8 ind_8 Group2




