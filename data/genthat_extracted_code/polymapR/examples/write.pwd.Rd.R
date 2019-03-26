library(polymapR)


### Name: write.pwd
### Title: Write a JoinMap compatible .pwd file from linkage data.frame.
### Aliases: write.pwd

### ** Examples

data("all_linkages_list_P1_split")
write.pwd(all_linkages_list_P1_split[["LG3"]][["homologue1"]],
           "LG3_homologue1_P1.pwd",
           "Please feed me to JoinMap")



