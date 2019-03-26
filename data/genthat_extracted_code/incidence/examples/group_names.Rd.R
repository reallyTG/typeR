library(incidence)


### Name: group_names
### Title: extract and set group names
### Aliases: group_names group_names<- group_names.default
###   group_names<-.default `group_names<-`.default group_names.incidence
###   group_names<-.incidence
### Keywords: accessors

### ** Examples

i <- incidence(dates = sample(10, 100, replace = TRUE), 
               interval = 1L,
               groups = sample(letters[1:3], 100, replace = TRUE))
i
group_names(i)

# change the names of the groups
group_names(i) <- c("Group 1", "Group 2", "Group 3")
i

# example if there are mistakes in the original data, e.g. 
# something is misspelled
set.seed(50)
grps <- sample(c("child", "adult", "adlut"), 100, replace = TRUE, prob = c(0.45, 0.45, 0.05))
i <- incidence(dates = sample(10, 100, replace = TRUE), 
               interval = 1L,
               groups = grps)
colSums(get_counts(i))

# If you change the name of the mis-spelled group, it will be merged with the
# correctly-spelled group
gname <- group_names(i)
gname[gname == "adlut"] <- "adult"
# without side-effects
print(ii <- group_names(i, gname))
colSums(get_counts(i))  # original still has three groups
colSums(get_counts(ii))
# with side-effects
group_names(i) <- gname
colSums(get_counts(i))



